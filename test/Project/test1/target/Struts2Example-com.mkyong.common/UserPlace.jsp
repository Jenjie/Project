<%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Google Map Search</title>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false&amp;libraries=places"></script>
</head>

<body>
<h1><s:property value="%{person.username}"/></h1>

<script type="text/javascript">
    function canSubmit() {
        return true;
    }
</script>

<form id="formssearch" method="post" action="search" onsubmit="return canSubmit()">
    <label>Start Location :</label>
    <input type="text" name="req.slocation" class="textbox" id="slocation" value="" /><br><br>
    <input type="hidden" value="" name="req.lng" id="lng">
    <input type="hidden" value="" name="req.lat" id="lat">
    <div>
        <label>How long travel</label><br><br>

        <select name="req.sday">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
        </select>

    </div>
    <br><br>
    <label>Start Date :</label>
    <input name="req.sdate" type="date" id="sdate" value="" />

    <br><br>
    <label>Start Time :</label>
    <input name="req.stime" type="time" id="stime" value="" />


    <label>End Time :</label>
    <input name="req.etime" type="time" id="etime" value="" />

    <div >
        <label>Catagories interest</label><br><br>
        <input type="checkbox" name="req.types" id="type-01" value="museum">Museum
        <input type="checkbox" name="req.types" id="type-02" value="hotel">Hotel
        <input type="checkbox" name="req.types" id="type-03" value="restaurant">Restaurant
        <input type="checkbox" name="req.types" id="type-04" value="park">Park
    </div>
    <br><br>

    <input type="submit" name="btnsubmit" value="Search">
</form>

<!--------------------Start Location---------------------------------->
<div id="map-canvas"></div>
<script type="text/javascript">
    //Autocomplete variables
    var input = document.getElementById('slocation');
    var searchform = document.getElementById('form1');
    var place;
    var autocomplete = new google.maps.places.Autocomplete(input);

    //Google Map variables
    var map;
    var marker;


    //Add listener to detect autocomplete selection
    google.maps.event.addListener(autocomplete, 'place_changed', function () {
        place = autocomplete.getPlace();
        console.log(place);
        document.getElementById('lat').value = place.geometry.location.lat() ;
        document.getElementById('lng').value = place.geometry.location.lng() ;
        console.log(document.getElementById('lat'));
//        console.log(document.getElementById('lng'));

    });


    //Add listener to search
    searchform.addEventListener("submit", function() {
        var newlatlong = new google.maps.LatLng(place.geometry.location.lat(),place.geometry.location.lng());

        //test
        console.log($("#lng").val());
        console.log($("#lat").val());

        map.setCenter(newlatlong);
        marker.setPosition(newlatlong);
        map.setZoom(12);

    });

    //Reset the inpout box on click
    input.addEventListener('click', function(){
        input.value = "";
    });
    function initialize() {
        var myLatlng = new google.maps.LatLng(51.517503,-0.133896);
        var mapOptions = {
            zoom: 1,
            center: myLatlng
        }
        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

        marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: 'Main map'
        });
    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>
<!--------------------Start Date---------------------------------->
<script>
    function myFunction() {
        var x = document.getElementById("myDate").form.id;
        document.getElementById("demo").innerHTML = x;
    }
</script>
<!--------------------Start Time---------------------------------->
<script>
    function myFunction() {
        var x = document.getElementById("myTime,myTime1").form.id;
        document.getElementById("demo").innerHTML = x;
    }
</script>



</body>
</html>