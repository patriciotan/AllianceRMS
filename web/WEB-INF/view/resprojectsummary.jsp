<%@include file="navigation.jsp" %>
<div id="bodiv">
    <div class="row page-header" style="margin-top: 0%;">
        <div style="float: left; width: 73%;">
            <ol class="breadcrumb">
                <li><a href="pSummary">Project Summary</a></li>
                <li class="active">${projectName}</li>
                <li class="pull-right">Duration <code>${start}</code> to <code>${end}</code></li>
            </ol>
            <input type="hidden" id="startDate" value="${start}" />
            <input type="hidden" id="endDate" value="${end}" />
        </div>
        <div style="float: left;" class="pull-right">
            <div class="btn-group">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <span style="color: #333333" class="glyphicon glyphicon-export" aria-hidden="true"></span> <b>Export table</b> <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#" onClick ="$('#respSummary').tableExport({type:'excel',escape:'false'});"> <img src='<c:url value="/res/images/xls.png"/>' width='16px'> XLS</a></li>
                    <li><a href="#" onClick ="$('#respSummary').tableExport({type:'csv',escape:'false'});"> <img src='<c:url value="/res/images/csv.png"/>' width='16px'> CSV</a></li>
                    <li><a href="#" onClick ="$('#respSummary').tableExport({type:'txt',escape:'false'});"> <img src='<c:url value="/res/images/txt.png"/>' width='16px'> TXT</a></li>
                </ul>
            </div>
            <button type="button" class="btn btn-primary assignOption" data-toggle="modal" data-target="#assign">
                <span style="color: #333333" class="glyphicon glyphicon-plus" aria-hidden="true"></span> <b>Assign new resource</b>
            </button>
        </div>
    </div>
    <div id="resourceSummary" class="col-md-12">
        <div class="row">
            <table id="respSummary" class="resProjects" class="display">   
                <thead>
                    <tr>
                        <th style="display:none;"></th>
                        <th style="display:none;"></th>
                        <th style="text-align: left"><b>Name</b></th>
                        <th style="text-align: left"><b>Year</b></th>
                        <th style="text-align: left"><b>Jan</b></th>
                        <th style="text-align: left"><b>Feb</b></th>
                        <th style="text-align: left"><b>Mar</b></th>
                        <th style="text-align: left"><b>Apr</b></th>
                        <th style="text-align: left"><b>May</b></th>
                        <th style="text-align: left"><b>Jun</b></th>
                        <th style="text-align: left"><b>Jul</b></th>
                        <th style="text-align: left"><b>Aug</b></th>
                        <th style="text-align: left"><b>Sep</b></th>
                        <th style="text-align: left"><b>Oct</b></th>
                        <th style="text-align: left"><b>Nov</b></th>
                        <th style="text-align: left"><b>Dec</b></th>
                    </tr>
                </thead>
                <tbody class="resources">
                    <c:forEach items="${resources}" var="resource">
                    <tr class="resourceRow" data-toggle="modal" data-target="#editResource" data-toggle="tooltip" data-placement="top" title="Click to edit/delete resource">  
                        <td style="display:none;"><input type="hidden" class="resoId" value="${resource.empId}"/></td>
                        <td style="display:none;"><input type="hidden" class="resoEId" value="${resource.effortId}"/></td>
                        <td style="text-align: left;" class="aResource"><c:out value="${resource.fname} ${resource.lname}" /></td>						
                        <td class="resoYear"><c:out value="${resource.year}" /></td>   
                        <td class="resoJan"><c:out value="${resource.jan}" /></td>   
                        <td class="resoFeb"><c:out value="${resource.feb}" /></td>   
                        <td class="resoMar"><c:out value="${resource.mar}" /></td>   
                        <td class="resoApr"><c:out value="${resource.apr}" /></td>   
                        <td class="resoMay"><c:out value="${resource.may}" /></td>   
                        <td class="resoJun"><c:out value="${resource.jun}" /></td>   
                        <td class="resoJul"><c:out value="${resource.jul}" /></td>   
                        <td class="resoAug"><c:out value="${resource.aug}" /></td>   
                        <td class="resoSep"><c:out value="${resource.sep}" /></td>   
                        <td class="resoOct"><c:out value="${resource.oct}" /></td>   
                        <td class="resoNov"><c:out value="${resource.nov}" /></td>   
                        <td class="resoDece"><c:out value="${resource.dece}" /></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
        
    <!-- Start modal for assign resources-->            
    <div class="modal fade" id="assign" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-l">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Assign resource to ${projectName}</b>
                            <input type="hidden" id="assignStart" value="${start}" />
                            <input type="hidden" id="assignEnd" value="${end}"/>
                        </div>
                        <form name="assign" action='<c:url value="assignResource"/>' method="post" modelAttribute="effort">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="">Name:</label>
                                    <input id="empName" class="form-control" name="empName" required="required"  list="empData"/>
                                    <datalist id="empData">
                                    </datalist>
                                </div>
                                <div class="form-group">
                                    <label for="">Effort</label>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Year</th>
                                                <th>Jan</th>
                                                <th>Feb</th>
                                                <th>Mar</th>
                                                <th>Apr</th>
                                                <th>May</th>
                                                <th>Jun</th>
                                                <th>Jul</th>
                                                <th>Aug</th>
                                                <th>Sep</th>
                                                <th>Oct</th>
                                                <th>Nov</th>
                                                <th>Dec</th>
                                            </tr>
                                        </thead>
                                        <tbody id="addResTable">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <input type="hidden" name="projId" id="projectId" value="${projectId}"/>
                                    <input type="hidden" name="count" id="count"/>
                                    <button class="btn btn-success" id="add-but1" type="submit">
                                        <span style="color: #333333" class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> <b>Assign</b>
                                    </button>
                                    <button class="btn btn-danger" type="button" data-dismiss="modal">
                                        <span style="color: #333333" class="glyphicon glyphicon-remove" aria-hidden="true"></span> <b>Cancel</b>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for assign resources-->
            
    <!-- Start modal for edit resources-->            
    <div class="modal fade" id="editResource" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-l">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <b>Edit resource effort</b>
                            <input type="hidden" id="editStart" value="${start}" />
                            <input type="hidden" id="editEnd" value="${end}"/>
                        </div>
                        <form name="edit" action='<c:url value="editResource"/>' method="post" modelAttribute="effort">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for=""><code><b id="eResource"></b></code></label>
                                    <a href="#" class="pull-right removeRes" data-dismiss="modal" data-toggle="modal" data-target="#removeRes">
                                        <span style="color: #333333" class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    </a>
                                </div>
                                <div class="form-group">
                                    <label for="">Effort
                                        <input type="hidden" name="empId" id="eId"/>
                                        <input type="hidden" name="effortId" id="effortId" />
                                        <input type="hidden" name="projId" value="${projectId}"/>
                                    </label>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Year</th>
                                                <th>Jan</th>
                                                <th>Feb</th>
                                                <th>Mar</th>
                                                <th>Apr</th>
                                                <th>May</th>
                                                <th>Jun</th>
                                                <th>Jul</th>
                                                <th>Aug</th>
                                                <th>Sep</th>
                                                <th>Oct</th>
                                                <th>Nov</th>
                                                <th>Dec</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><input type="number" name="year" style="width:55px;" id="eYear" readonly/></td>
                                                <td><input type="number" name="jan" style="width:55px;" value="0" min="0" step="0.1" id="e1"/></td>
                                                <td><input type="number" name="feb" style="width:55px;" value="0" min="0" step="0.1" id="e2"/></td>
                                                <td><input type="number" name="mar" style="width:55px;" value="0" min="0" step="0.1" id="e3"/></td>
                                                <td><input type="number" name="apr" style="width:55px;" value="0" min="0" step="0.1" id="e4"/></td>
                                                <td><input type="number" name="may" style="width:55px;" value="0" min="0" step="0.1" id="e5"/></td>
                                                <td><input type="number" name="jun" style="width:55px;" value="0" min="0" step="0.1" id="e6"/></td>
                                                <td><input type="number" name="jul" style="width:55px;" value="0" min="0" step="0.1" id="e7"/></td>
                                                <td><input type="number" name="aug" style="width:55px;" value="0" min="0" step="0.1" id="e8"/></td>
                                                <td><input type="number" name="sep" style="width:55px;" value="0" min="0" step="0.1" id="e9"/></td>
                                                <td><input type="number" name="oct" style="width:55px;" value="0" min="0" step="0.1" id="e10"/></td>
                                                <td><input type="number" name="nov" style="width:55px;" value="0" min="0" step="0.1" id="e11"/></td>
                                                <td><input type="number" name="dece" style="width:55px;" value="0" min="0" step="0.1" id="e12"/></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        <div class="panel-footer">
                            <div style="text-align: right">
                                <button class="btn btn-success" id="add-but" type="submit">
                                    <span style="color: #333333" class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> <b>Save</b>
                                </button>
                                <button class="btn btn-danger" type="button" data-dismiss="modal">
                                    <span style="color: #333333" class="glyphicon glyphicon-remove" aria-hidden="true"></span> <b>Cancel</b>
                                </button>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for edit resources-->

    <!-- Start modal for remove resource-->            
    <div class="modal fade" id="removeRes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-s">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Remove Resource</b>
                        </div>
                        <form name="del" action='<c:url value="deleteResource"/>' method="post" modelAttribute="effort">
                            <div class="panel-body">
                                <div class="form-group" style="text-align: center;">
                                    <label>Are you sure you want to remove <b id="remName"></b>?</label>
                                    <input type="hidden" name="empId" id="removeId"/>
                                    <input type="hidden" name="projId" value="${projectId}"/>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right;">
                                    <button class="btn btn-success" id="add-but" type="submit">
                                        <span style="color: #333333" class="glyphicon glyphicon-floppy-ok" aria-hidden="true"></span> <b>Yes</b>
                                    </button>
                                    <button class="btn btn-danger" type="button" data-dismiss="modal">
                                        <span style="color: #333333" class="glyphicon glyphicon-remove" aria-hidden="true"></span> <b>No</b>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for remove resource-->   
    
</div>
</div>
</div><!-- closing div from navigation-->
    </body>
    <script>
        $(document).ready(function(){
           $("#2").attr("class","active"); 
           $(".resProjects").dataTable({
               "oLanguage":{
                   "sInfoEmpty":'No Resources To Show',
                   "sEmptyTable":'No Resources To Show',
               }
           });
           $(".resourceRow").tooltip();
           
           $("#end1").change(function(){
                $("#error2").html("");
                var startDate = new Date($("#start1").val());
                var endDate = new Date($(this).val());
                if(startDate>endDate){
                    $("#error2").css("display","true");
                    $("#error2").text("End date should be after or equal the start date.");
                    $("#add-but1").attr("disabled","true");
                }else{
                    $("#add-but1").removeAttr("disabled");
                }
            });
            
            $("#start1").change(function(){
               $("#end1").change(); 
            });
        
            $(".removeRes").click(function(){
               $("#remName").text($("#eResource").text()); 
               $("#removeId").val($("#eId").val());
               $("#removeTId").val($("#eTId").val());
            });

            $(".resources").on("click",".resourceRow",function(){
                var yearSelected=$(this).children(".resoYear").text();
                
                $("#effortId").val($(this).children().children(".resoEId").val());
                $("#eId").val($(this).children().children(".resoId").val());
                $("#eResource").html($(this).children(".aResource").text()); 
                $("#eYear").val(yearSelected);
                $("#e1").val($(this).children(".resoJan").text());
                $("#e2").val($(this).children(".resoFeb").text());
                $("#e3").val($(this).children(".resoMar").text());
                $("#e4").val($(this).children(".resoApr").text());
                $("#e5").val($(this).children(".resoMay").text());
                $("#e6").val($(this).children(".resoJun").text());
                $("#e7").val($(this).children(".resoJul").text());
                $("#e8").val($(this).children(".resoAug").text());
                $("#e9").val($(this).children(".resoSep").text());
                $("#e10").val($(this).children(".resoOct").text());
                $("#e11").val($(this).children(".resoNov").text());
                $("#e12").val($(this).children(".resoDece").text());
                
                var start = $("#editStart").val();
                var end = $("#editEnd").val();
                var startYear = start.substring(0,4);
                var endYear = end.substring(0,4);
                
                var startMonth = start.substring(5,7);
                var endMonth = end.substring(5,7);
                
//                for(var i=1;i<=12;i++){
//                    $("#e"+i).attr("disabled","true");
//                }
                
//                if(startYear==endYear){
//                    for(var i=1;i<=12;i++){
//                        if(i>=startMonth&&i<=endMonth){
//                            $("#e"+i).removeAttr("disabled");
//                        }
//                    }
//                }else{
//                    if(startYear==yearSelected){
//                        for(var i=parseInt(startMonth);i<=12;i++){
//                            $("#e"+i).removeAttr("disabled");
//                        }
//                    }else if(endYear==yearSelected){
//                        for(var i=1;i<=endMonth;i++){
//                            $("#e"+i).removeAttr("disabled");
//                        }
//                    }else{
//                        for(var i=1;i<=12;i++){
//                            $("#e"+i).removeAttr("disabled");
//                        }
//                    }
//                }
                $.ajax({
                    url:'getTotalEffort.htm',
                    type:'post',
                    data:{'year':yearSelected,'resId': $("#eId").val()},
                    success:function(data,status){
                        var x = data.toString();
                        var res=x.split("%");
                        for(var i=1;i<=12;i++){
                            var wait = Math.round((1-res[i])*10)/10;
                            var finall = Math.round((wait+parseFloat($("#e"+i).val()))*10)/10; 
                            $("#e"+i).attr("max",finall);
                        }
                    },  
                        error : function(e) {  
                        alert('Error: ' + e);   
                    }
                });
                
            });
            
            
            $(".assignOption").click(function(){ 
               $("#addResTable").html("");
               
               var start = $("#assignStart").val();
               var end = $("#assignEnd").val();
               var startYear = start.substring(0,4);
               var endYear = end.substring(0,4);
               var diffYear=endYear-startYear;
               
               $("#empName").val("");
               $("#add-but1").attr("disabled","true");
               $("#count").val(diffYear+1);
               for(var i=0;i<=diffYear;i++){
                   var t=i*12;
                   $("#addResTable").append("<tr>" +
                                            "<input type='hidden' name='year' value='"+(parseInt(startYear)+i)+"' class='year'/>" +
                                            "<td>"+(parseInt(startYear)+i)+"</td>" +
                                            "<td><input type='number' name='jan' value='0' min='0' disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+1)+"'/></td>" +
                                            "<td><input type='number' name='feb' value='0' min='0' disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+2)+"'/></td>" +
                                            "<td><input type='number' name='mar' value='0' min='0' disabled='true' style='width:55px;' step='0.1' class='month"+(parseInt(t)+3)+"'/></td>" +
                                            "<td><input type='number' name='apr' value='0' min='0' disabled='true'  style='width:55px;' step='0.1' class='month"+(parseInt(t)+4)+"'/></td>" +
                                            "<td><input type='number' name='may' value='0' min='0' disabled='true'  style='width:55px;' step='0.1' class='month"+(parseInt(t)+5)+"'/></td>" +
                                            "<td><input type='number' name='jun' value='0' min='0' disabled='true'  style='width:55px;' step='0.1' class='month"+(parseInt(t)+6)+"'/></td>" +
                                            "<td><input type='number' name='jul' value='0' min='0' disabled='true'  style='width:55px;' step='0.1' class='month"+(parseInt(t)+7)+"'/></td>" +
                                            "<td><input type='number' name='aug' value='0' min='0' disabled='true'  style='width:55px;' step='0.1' class='month"+(parseInt(t)+8)+"'/></td>" +
                                            "<td><input type='number' name='sep' value='0' min='0' disabled='true'  style='width:55px;' step='0.1' class='month"+(parseInt(t)+9)+"'/></td>" +
                                            "<td><input type='number' name='oct' value='0' min='0' disabled='true'  style='width:55px;' step='0.1' class='month"+(parseInt(t)+10)+"'/></td>" +
                                            "<td><input type='number' name='nov' value='0' min='0' disabled='true'  style='width:55px;' step='0.1' class='month"+(parseInt(t)+11)+"'/></td>" +
                                            "<td><input type='number' name='dece' value='0' min='0' disabled='true'  style='width:55px;' step='0.1' class='month"+(parseInt(t)+12)+"'/></td>" +
                                        "</tr>");
               }
                
                
                $.ajax({
                    url:'getEmployeesNotProject.htm',
                    type:'post',
                    data:{'id':${projectId}},
                    success:function(data,status){
                        $("#empData").html("");
                        var line = data.toString().split("$$$");
                        for(var x=0;x<line.length-1;x++){
                            var each = line[x].split("%-.");
                            $("#empData").append('<option value="'+each[1]+'"></option>');
                        }
                    }
                })
            });
           
            $("#empName").change(function(){
                var selectedName = $("#empName").val();
                var obj=$("#empData").find("option[value='"+selectedName+"']");
                
                var start = $("#assignStart").val();
                var end = $("#assignEnd").val();

                var startYear = start.substring(0,4);
                var endYear = end.substring(0,4);
                var diffYear=endYear-startYear;

                var startMonth = start.substring(5,7);
                var endMonth = end.substring(5,7);

                var last=(diffYear+1)*12;
                var end=parseInt(endMonth)+(diffYear*12);
                var resName=$(this).val();
                if(obj.length==0){
                    $("#add-but1").attr("disabled","true");
                    for(var x=0;x<=diffYear;x++){
                        var t=x*12;
                        for(var i=1;i<=12;i++){
                           $(".month"+(parseInt(t)+i)).val("0");
                           $(".month"+(parseInt(t)+i)).attr("disabled","true");
                        }
                    }
                }else{
                    $.ajax({
                        url:'getSpecificEffortMonth.htm',
                        type:'post',
                        data:{'year':startYear,'noYears':diffYear+1,'resName':resName},
                        success:function(data,status){
                            var x = data.toString();
                            var res=x.split("%");
                            for(var x=0;x<=diffYear;x++){
                                var t=x*12;
                                for(var i=1;i<=12;i++){
                                   $(".month"+(parseInt(t)+i)).val("0");
                                   $(".month"+(parseInt(t)+i)).removeAttr("disabled");
                                }
                            }

                            for(var i=1;i<=last;i++){
                                $(".month"+i).removeAttr("max");
                                $(".month"+i).attr("max",Math.round( (1-res[i]) * 10 ) / 10);
                                var z=Math.round( (1-res[i]) * 10 ) / 10;
                                $(".month"+i).tooltip({'trigger':'focus','placement':"bottom"});
                                $(".month"+i).attr('data-original-title'," Maximum effort for the selected month is "+z+".");
                            }
                            $(".month1").focus();
                            $("#add-but1").removeAttr("disabled");
                        }
                    });
                }
            });
        });
    </script>
</html>