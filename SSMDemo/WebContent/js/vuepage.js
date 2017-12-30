var app1 = new Vue({
    el: "#app1",
    data: {
        //声明空数组，进行数据接收，最后传递到前端页面
        itemList: [],
    },
    //向data数组里添加数据
    mounted: function() {
        this.getData();
    },
    methods: {
        getData: function() {
            var self = this;
            this.$http.get("/SSMDemo/serverService/firstService").then(function(res) {
                var selData = res.body
                self.itemList = selData;
            })
        }
    }
});
var app2 = new Vue({
    el: "#app2",
    data: {
        //声明空数组，进行数据接收，最后传递到前端页面
        itemList: [],
    },
    //向data数组里添加数据
    mounted: function() {
        this.getData();
    },
    methods: {
        getData: function() {
            var self = this;
            this.$http.get("/SSMDemo/serverService/getService").then(function(res) {
                var selData = res.body
                self.itemList = selData;
            })
        }
    }
});
