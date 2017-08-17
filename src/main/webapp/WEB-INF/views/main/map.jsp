<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
	<script type="text/javascript" src="/resources/js/jquery/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="https://js.arcgis.com/3.21/esri/css/esri.css">
	<script src="https://js.arcgis.com/3.21/"></script>
	<script type="text/javascript">
	var map, toolbar;

    require(["esri/map", 
             "esri/layers/ArcGISTiledMapServiceLayer", 
             "esri/layers/ArcGISDynamicMapServiceLayer", 
             "esri/tasks/query",
             "esri/tasks/QueryTask",
             "esri/tasks/GeometryService",
             "esri/layers/GraphicsLayer",
      		"esri/geometry/Point",
      		"esri/symbols/SimpleFillSymbol",
      		"esri/symbols/SimpleLineSymbol",
      		"esri/Color",
      		"esri/toolbars/draw",
      		"esri/graphic",
      		"esri/SpatialReference",
      		"dojo/domReady!"],
      function(Map, ArcGISTiledMapServiceLayer,ArcGISDynamicMapServiceLayer, Query, QueryTask, GeometryService, GraphicsLayer, Point,SimpleFillSymbol, SimpleLineSymbol, Color, Draw, Graphic, SpatialReference) {
		map = new Map("map", {logo:false, scalebarUnit: "dual"});
        
        var tiled = new ArcGISTiledMapServiceLayer("http://gis.edumac.kr:6080/arcgis/rest/services/EDUMAC/EDU_CACHEDMAP_LAYER/MapServer");
        map.addLayer(tiled);

        var opLayer = new esri.layers.ArcGISDynamicMapServiceLayer("http://localhost:6080/arcgis/rest/services/GSP_DYNAMIC_SYMBOL_LAYER_v1_0/MapServer");
        map.addLayer(opLayer);
        
        var tempLayer = new GraphicsLayer();
        map.addLayer(tempLayer);
        
        toolbar = new Draw(map);
        toolbar.on("draw-end", function(evtObj) {
        	var geometry = evtObj.geometry;
            var symbol = new SimpleFillSymbol(
              SimpleFillSymbol.STYLE_SOLID,
              new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID, new Color([0, 0, 0]), 2),
              new Color([0, 0, 255, 0.5]));
            var graphic = new Graphic(geometry, symbol);
            tempLayer.add(graphic);
            toolbar.deactivate();
        });
        var geometryService = new GeometryService("http://localhost:6080/arcgis/rest/services/Utilities/Geometry/GeometryServer");
        
        var query = new Query();
        query.where = "OBJECTID = 1";
        query.outSpatialReference = {wkid:102082}; 
        query.returnGeometry = true;
        query.outFields = ["*"];
        var emdFeature, sggFeature;
        var queryTask = new QueryTask("http://localhost:6080/arcgis/rest/services/GSP_CACHEMAP_LAYER/MapServer/2");
        queryTask.execute(query, function(result) {
        	emdFeature = result.features[0];
        	/*
        	var areasAndLengthParams = new AreasAndLengthsParameters();
			areasAndLengthParams.lengthUnit = GeometryService.UNIT_METER;
			areasAndLengthParams.areaUnit = GeometryService.UNIT_SQUARE_METERS;
			areasAndLengthParams.polygons = [emdFeature.geometry];
			geometryService.areasAndLengths(areasAndLengthParams, function(measurements){
				console.log("measurements", measurements);
			});
			*/
        	
        	
        	tempLayer.add( result.features[0] );
    		map.setExtent(
    				esri.graphicsExtent(tempLayer.graphics)
    			);
    		
    		
    		
    		// 심볼지정
        	var sfs =
        		new SimpleFillSymbol(
        			SimpleFillSymbol.STYLE_SOLID,
        		    new SimpleLineSymbol(
        		    		SimpleLineSymbol.STYLE_DASHDOT,
        		    		new Color([255,0,0]),
        		    		2
        		    ),
        		    new Color([255,255,0,0.25])
        		  );
        	result.features[0].setSymbol(sfs);
        	
        	var query = new Query();
        	query.geometry = result.features[0].geometry;
            query.outSpatialReference = {wkid:102082}; 
            query.returnGeometry = true;
            query.outFields = ["*"];
            
            var queryTask = new QueryTask("http://localhost:6080/arcgis/rest/services/GSP_CACHEMAP_LAYER/MapServer/1");
            queryTask.execute(query, function(result) {
            	sggFeature = result.features[0];
            	
            	
            	console.log("result", result);
            });
        	
        });
        
      }
    );
    //test
	function zoomToLayer(layerId) {
		var zoomExtent = esri.graphicsExtent(map.getLayer(layerId).graphics);
		map.setExtent(zoomExtent);
	};
	
	function drawPolygon() {
        toolbar.activate("polygon");
	}
	function clearPolygon() {
        toolbar.deactivate();
	}
	</script>
</head>
<body>
<a href="javascript:drawPolygon()">폴리곤 그리기</a>
<a href="javascript:clearPolygon()">폴리곤 완료</a>
<div id="map" style="width:1024px;height:768px;border:1px solid;"></div>
</body>
</html>
