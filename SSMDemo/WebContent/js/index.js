$(function(){
    function tgClass(obj,toClass){
        return obj.addClass(toClass).siblings().removeClass(toClass);
    }
/*发布需求*/
setTimeout(function(){
    var classifyArr = [
        {dataId: 0, classify: '骑行'},
        {dataId: 1, classify: '水暖'},
        {dataId: 2, classify: '家具'},
        {dataId: 3, classify: '开锁'},
    ];
    var cOnehtml = $('.classify-box').find('span').first().html(),
        cTwo = $('.classify-two'),
        cThree = $('.c_three');
    for (var i = 0; i < classifyArr.length; i++) {
        if (cOnehtml === classifyArr[i].classify) {
            (function(index){
                for (var i = 0; i < cTwo.length; i++) {
                    tgClass(cTwo.eq(classifyArr[index].dataId),'block');
                }
            })(i);
        }
    }
    
    var boxtwo = $('.c_two'),
        boxthree = $('.c_three');    
    function kindhide(){
        boxtwo.hide(300);
        boxthree.removeAttr('style');
    }
    function kindShow(){
        boxtwo.show(300);
        boxthree.hide(300);
    }
    $('.J_kindtwo').click(function(){
        tgClass($(this),'active');
        kindShow();
    })    
    $('.J_kindthree').click(function(){
        tgClass($(this),'active');
        kindhide();
    })    
    /*二级进入到三级*/
         cTwo.on('click','span',function(){
            var _this = $(this),
                this_Id = _this.data('id'),
                thisP_Id = _this.parent().data('id'),
                cThreeItem = cThree.children();
            tgClass(_this,'active');
            tgClass($('.J_kindthree'),'active');
                kindhide();
            for (var i = 0; i < cThreeItem.length; i++) {
                cThreeId = cThreeItem.eq(i).data('id');
                if(cThreeId === thisP_Id){
                    (function(index){
                        tgClass(cThreeItem.eq(index),'block');
                        var detailItem  = cThreeItem.eq(index).children(),
                            detailItem_Id;
                        for (var i = 0; i < detailItem.length; i++) {
                            detailItem_Id = detailItem.eq(i).data('id');
                            if(detailItem_Id === this_Id){
                                tgClass(detailItem.eq(i),'block');
                            }
                        }    
                    })(i)
                }
            }
         });    
     },1000);    
   
/*待接单*/ 
    var ifdetail = $('.J_toggle');
    ifdetail.click(function(){
        $(this).toggleClass('down').parents('.order-detail').toggleClass('active');
    });
/*弹出框*/
var popBox = $('.alert-layer');
    function showPop(obj){
        obj.removeClass('none');
    };
    function hidePop(obj){
        obj.addClass('none');
    };
    $('.J_addFare').click(function(){
        showPop(popBox);
    }) 
    $('.J_cancel,.J_confirm').click(function(){
        hidePop(popBox);
    });
    popBox.click(function(e){
        var objSrc = e.target.getAttribute('class');
        if(objSrc === 'alert-layer'){
            $(this).addClass('none');   
        } else{
            return false;
        }
    })        
//获取验证码 
    var t,
        timer,
        JgetCode=$('.J_GetCode'),
        bState=true;
    function getCode(){
        t=3;
        clearInterval(timer);
        timer=setInterval(function(){
            bState = false;
            JgetCode.html(t+"&nbsp;s").addClass('code_gray');
            if (t==0) {
                clearInterval(timer);
                JgetCode.html("获取验证码").removeClass('code_gray');
                bState = true;
            };
            t--;
        },1000);
    };
    JgetCode.click(function(){
        bState && getCode();
    });
// 维修工星级评价
    var gradeId = 4 
    var gradeItem = $('.J_grade').find('span');
    for (var i = 0; i < gradeItem.length; i++) {
        if(i < gradeId){
            gradeItem.eq(i).addClass('active');
        }
    }        
})