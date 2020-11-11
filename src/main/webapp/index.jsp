<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script language="JavaScript">

        function calculate(arg1,arg2,arg3) {
            var result;
            arg1=document.getElementById("one").value
            arg2=document.getElementById("two").value
            arg3=parseInt(document.getElementById("projectPorperty").value)

            // document.write(arg3)

            switch (arg3) {
                case 0:result=accAdd(arg1,arg2)
                    break
                case 1:result=Subtr(arg1,arg2)
                    break
                case 2:result=accMul(arg1,arg2)
                    break
                case 3:result=accDiv(arg1,arg2)
                    break
                default:result=null
            }

            document.getElementById("result").value=result

        }
        //除法
        function accDiv(arg1,arg2){
            var t1=0,t2=0,r1,r2;
            try{t1=arg1.toString().split(".")[1].length}catch(e){}
            try{t2=arg2.toString().split(".")[1].length}catch(e){}
            with(Math){
                r1=Number(arg1.toString().replace(".",""))
                r2=Number(arg2.toString().replace(".",""))
                return accMul((r1/r2),pow(10,t2-t1));
            }
        }
        //乘法
        function accMul(arg1,arg2)
        {
            var m=0,s1=arg1.toString(),s2=arg2.toString();
            try{m+=s1.split(".")[1].length}catch(e){}
            try{m+=s2.split(".")[1].length}catch(e){}

            return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)
        }
        //加法
        function accAdd(arg1,arg2){

            var r1,r2,m;
            try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
            try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
            m=Math.pow(10,Math.max(r1,r2))

            return (arg1*m+arg2*m)/m
        }
        //减法
        function Subtr(arg1,arg2){
            var r1,r2,m,n;
            try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
            try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
            m=Math.pow(10,Math.max(r1,r2));
            n=(r1>=r2)?r1:r2;
            return ((arg1*m-arg2*m)/m).toFixed(n);
        }
    </script>
</head>
<body>
<div style="width: 500px;height: 200px;color: ghostwhite;background-color: darksalmon;margin-left: 400px;" align="center" >
    <br>
    <form action="" name="login" method="post" style="margin-top: 30px;">
        第一个数：<input type="text" name="one" id="one"><br>
        运算：<select id="projectPorperty" name="projectPorperty" style="margin-left: 60px;margin-right: 30px;">
            <option value="0">+</option>
            <option value="1">-</option>
            <option value="2">*</option>
            <option value="3">/</option>
        </select>
        <br>
        第二个数：<input type="text" name="two" id="two"><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;等于：<input type="text" name="result" id="result"  ><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="结果" onclick="calculate()">
        <input type="submit" value="取消">
    </form>
</div>

</body>
</html>
