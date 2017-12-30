window.onload = function(){
    function getId(id){
        return document.getElementById(id);
    }
    var map = new AMap.Map('container');
    //获取用户所在城市信息
    AMap.plugin(['AMap.CitySearch'],function(){
        //创建高级信息窗体并在指定位置打开
        var citysearch = new AMap.CitySearch();
        citysearch.getLocalCity(function(status, result) {
            if (status === 'complete' && result.info === 'OK') {
                if (result && result.city && result.bounds) {
                    var cityinfo = result.city;
                    var citybounds = result.bounds;
                    getId('currentPos').innerHTML = cityinfo+'<i class="head-tringle"></i>';
                    //地图显示当前城市
                    map.setBounds(citybounds);
                }
            } else {
                getId('currentPos').innerHTML = result.info+'<i class="head-tringle"></i>';
            }
        });
    })
    function cityPickerReady(cityPicker) {
        window.cityPicker = cityPicker;
        //引用domLibaray(Zepto)
        AMapUI.setDomLibrary($);
        AMapUI.load(['lib/$'], function($) {
            //选中某个城市
            cityPicker.on('citySelected', function(cityInfo) {
                //隐藏城市列表面板
                cityPicker.hideImmediately();
                //清除搜索框内容
                cityPicker.clearSearch();
                notifyCityInfo(cityInfo);
            });
        var marker = new AMap.Marker({
            content: ' '
        });
            /*显示对应的城市信息*/
            //jshint -W003
            function notifyCityInfo(cityInfo) {
                $("#selectedCityInfo").html(JSON.stringify(cityInfo, null, 2));
                marker.setMap(map);
                marker.setPosition([cityInfo.lng, cityInfo.lat]);
                map.setCenter(marker.getPosition());
            }
        });
    }

    /*城市提示*/
    AMapUI.loadUI(['misc/MobiCityPicker'], function(MobiCityPicker) {
        var cityPicker = new MobiCityPicker({
            topGroups: [{
                //组的唯一标识
                id: 'common_city',
                //标题
                title: '热门城市',
                //右侧锚点索引标题，建议单个字符
                anchorTitle: '☆',
                //城市的adcodes列表(adcodes内容可以用MobiCityPicker.getCityData()获取)
                adcodes: [
                    "110000",
                    "310000",
                    "440300",
                    "440100",
                    "510100",
                    "330100",
                    "320500",
                    "500000",
                    "420100",
                    "610100",
                    "320100",
                    "120000"
                ]
            }]
        });
        cityPickerReady(cityPicker);
        cityPicker.on('citySelected', function(cityInfo) {
            //隐藏城市列表
            cityPicker.hide();
            //选中的城市信息 
            console.log(cityInfo);
            $('.head-location').html(cityInfo.name+'<i class="head-tringle"></i>');
        });      
        $('.head-location').click(function() {
            cityPicker.show();
        });
    });

    /*选址*/
    function choicePos(){
        AMapUI.loadUI(['misc/PositionPicker'], function(PositionPicker) {
            var positionPicker = new PositionPicker({
                mode: 'dragMap',
                map: map
            });
            positionPicker.on('success', function(positionResult) {
                console.log(positionResult.address);
            });
            positionPicker.start();    
        });        
    }
    /*精准定位*/
    map.plugin('AMap.Geolocation', function () {
        geolocation = new AMap.Geolocation({
            enableHighAccuracy: true,//是否使用高精度定位，默认:true
            timeout: 10000,          //超过10秒后停止定位，默认：无穷大
            maximumAge: 0,           //定位结果缓存0毫秒，默认：0
            convert: true,           //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
            showButton: true,        //显示定位按钮，默认：true
            buttonPosition: 'LB',    //定位按钮停靠位置，默认：'LB'，左下角
            buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
            showMarker: true,        //定位成功后在定位到的位置显示点标记，默认：true
            showCircle: false,        //定位成功后用圆圈表示定位精度范围，默认：true
            panToLocation: true,     //定位成功后将定位到的位置作为地图中心点，默认：true
            markerOptions: {
                icon: new AMap.Icon({            
                    //size: new AMap.Size(28, 30),  //图标大小
                    image: "img/location.svg",
                    imageOffset: new AMap.Pixel(0, 0)
                })        

            },
            zoomToAccuracy:true      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
        });
        map.addControl(geolocation);
        geolocation.getCurrentPosition();
        AMap.event.addListener(geolocation, 'complete',function(){
            map.setZoom(16);
            map.panBy(0, -80);
            choicePos();
        });//返回定位信息
    });
}
