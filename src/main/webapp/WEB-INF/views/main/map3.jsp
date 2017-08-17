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
		var map;
		dojo.require("esri.map");
		dojo.addOnLoad(init);
		
		// 지도 초기화
		function init() {
			console.log("init");
		};
		
		// 레이어 추가
		function addLayer() {
			
		};
		
		// 폴리곤 그리기
		function drawPolygon() {
			
		}
		
	</script>
</head>
<body>
<a href="javascript:addLayer()">레이어 추가</a>
<a href="javascript:drawPolygon()">폴리곤 그리기</a>
<div id="map" style="width:1024px;height:768px;border:1px solid;"></div>
</body>
</html>
