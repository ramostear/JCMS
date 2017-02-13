$(document).ready(function enrollReviewPie() {
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('enrollReviewPie'));

	    // 指定图表的配置项和数据
	    var option = {
	    tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b}: {c} ({d}%)"
	    },
	    legend: {
	        orient: 'vertical',
	        x: 'left',
	        data:['已审核','未审核','已通过','未通过','待定']
	    },
	    series: [
	        {
	            name:'访问来源',
	            type:'pie',
	            radius: ['50%', '70%'],
	            avoidLabelOverlap: false,
	            label: {
	                normal: {
	                    show: false,
	                    position: 'center'
	                },
	                emphasis: {
	                    show: true,
	                    textStyle: {
	                        fontSize: '30',
	                        fontWeight: 'bold'
	                    }
	                }
	            },
	            labelLine: {
	                normal: {
	                    show: false
	                }
	            },
	            data:[
	                {value:335, name:'已审核'},
	                {value:310, name:'未审核'},
	                {value:234, name:'已通过'},
	                {value:135, name:'未通过'},
	                {value:1548, name:'待定'}
	            ]
	        }
	    ]
	};

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    window.onresize = myChart.resize;
});

//报名总览页面柱状图
$(document).ready(function enrollSimpleBar() {
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('enrollSimpleBar'));

	    // 指定图表的配置项和数据
	    var option = {
		    title : {
	        text: '世界人口总量',
	        subtext: '数据来自网络'
	    },
	    tooltip : {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['2011年', '2012年']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis : [
	        {
	            type : 'category',
	            data : ['男女','民族','生源地','印度','中国','世界人口(万)']
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            boundaryGap : [0,1]
	        }
	    ],
	    series : [
	        {
	            name:'2011年',
	            type:'bar',
	            data:[18203, 23489, 29034, 104970, 131744, 630230]
	        },
	        {
	            name:'2012年',
	            type:'bar',
	            data:[19325, 23438, 31000, 121594, 134141, 681807]
	        }
	    ]
	}

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    window.onresize = myChart.resize;
  
});
        



