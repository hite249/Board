<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
	<link rel="stylesheet" href="https://js.arcgis.com/3.21/esri/css/esri.css">
	<script src="https://js.arcgis.com/3.16/"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		var map, toolbar;
		dojo.require("esri.map");
		dojo.addOnLoad(init);
		dojo.require("esri.toolbars.draw");
		dojo.require("esri.symbols.SimpleFillSymbol");
		
		
		
		// 지도 초기화
		function init() {
		 
			map= new esri.Map("map");
			toolbar = new esri.toolbars.Draw(map);
			dojo.connect(toolbar, "onDrawEnd", addToMap);
			console.log("init");
			var mapLayer = new esri.layers.ArcGISTiledMapServiceLayer("http://gis.edumac.kr:6080/arcgis/rest/services/EDUMAC/EDU_CACHEDMAP_LAYER/MapServer");
			map.addLayer(mapLayer);
		};
		
		// 레이어 추가
		function addLayer() {
			
			var mapDLayer = new esri.layers.ArcGISDynamicMapServiceLayer("http://gis.edumac.kr:6080/arcgis/rest/services/SCHEVAL_2016/EDU_DLAYER_SCHEVAL/MapServer");
			var mapLLayer = new esri.layers.ArcGISDynamicMapServiceLayer("http://localhost:6080/arcgis/rest/services/GSP_DYNAMIC_LABEL_LAYER_v1_0/MapServer");
			map.addLayer(mapDLayer);
			map.addLayer(mapLLayer);
		};
		
		// 폴리곤 그리기
		function drawPolygon() {
			
			toolbar.activate(esri.toolbars.Draw.POLYGON);
		
		}
		function addToMap(geometry) {
			var sfs = new esri.symbol.SimpleFillSymbol(esri.symbol.SimpleFillSymbol.STYLE_SOLID,
					  new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_DASHDOT,
					  new esri.Color([255,0,0]), 2),new esri.Color([255,255,0,0.25]));
			  var graphic = new esri.Graphic(geometry, sfs);
			  map.graphics.add(graphic);
		}
		
		// 폴리곤 그리기 종료
		
		function endDraw(){
			toolbar.deactivate();
		}
	</script>
</head>
<body>
<a href="javascript:addLayer()">레이어 추가</a>
<a href="javascript:drawPolygon()">폴리곤 그리기</a>
<a href="javascript:endDraw()"> 그리기 종료</a>
<div id="map" style="width:1024px;height:768px;border:1px solid;"></div>
</body>
</html>
