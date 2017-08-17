<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
	<link rel="stylesheet" href="https://js.arcgis.com/3.21/esri/css/esri.css">
	<script src="https://js.arcgis.com/3.16/"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		var map;
		dojo.require("esri.map");
		dojo.addOnLoad(init);
		
		function init() {
			map = new esri.Map("map");
			
			// 타일맵 레이어
			var tiledLayer = new esri.layers.ArcGISTiledMapServiceLayer("http://gis.edumac.kr:6080/arcgis/rest/services/EDUMAC/EDU_CACHEDMAP_LAYER/MapServer");
			map.addLayer(tiledLayer);
		};
		
		function addLayer() {
			// 다이나믹 레이어
			var schevalLayer = new esri.layers.ArcGISDynamicMapServiceLayer("http://gis.edumac.kr:6080/arcgis/rest/services/SCHEVAL_2016/EDU_DLAYER_SCHEVAL/MapServer");
			map.addLayer(schevalLayer);
			
			var schevalLabelLayer = new esri.layers.FeatureLayer("http://gis.edumac.kr:6080/arcgis/rest/services/SCHEVAL_2016/EDU_DLABEL_SCHEVAL/MapServer");
			map.addLayer(schevalLabelLayer);
		}
	</script>
</head>
<body>
<a href="javascript:addLayer()">레이어 추가</a>
<div id="map" style="width:1024px;height:768px;border:1px solid;"></div>
</body>
</html>
