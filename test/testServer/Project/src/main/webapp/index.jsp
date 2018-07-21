<%--
  Created by IntelliJ IDEA.
  User: jane
  Date: 10/04/2018
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="login" method="post" action="login" onsubmit="return canSubmit()">
    <label>Login :</label>
    <input type="text" name="person.id" id="id" value="" /><br><br>
    <label>Username :</label>
    <input type="text" name="person.username" id="username" value="" /><br><br>
    <label>address :</label>
    <input type="text" name="person.address" id="location" value="" /><br><br>
    <input type="button" name="btn" onclick="getLocation()" value="location"><br><br>
    <input type="submit" name="login" value="login">
</form>
<script>
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition,PositionError);
        } else {
            lat.innerHTML = "Geolocation is not supported by this browser.";
        }
    }
    function showPosition(position) {
        var lat = position.coords.latitude ;
        var lng = position.coords.longitude ;
        document.getElementById("location").value = lat+","+lng ;

        var geocoder = new google.maps.Geocoder();
        var latLng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
        if (geocoder) {
            geocoder.geocode({ 'latLng': latLng}, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    console.log(results[0].formatted_address);
                    var x = results[0].formatted_address;
                    var idplace = results[0].place_id;
                    document.getElementById("slocation").value = x ;
                    document.getElementById("idplace").value = idplace ;
                    window.alert("current your location :"+document.getElementById("slocation").value);
                }
                else {
                    console.log("Geocoding failed: " + status);
                }
            });
        }
    }
    function PositionError(error) {
        window.alert(error.message);
    }
</script>
</body>
</html>
