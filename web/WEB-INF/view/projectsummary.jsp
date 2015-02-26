<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="navigation.jsp" %>

<div id="bodiv">
    <div class="row page-header" style="margin-top: 0%;">
        <div style="float: left; width: 78%;">
            <ol class="breadcrumb">
                <li class="active">Project Summary</li>
            </ol>
        </div>
        <div style="float: left;" class="pull-right">
            <div class="btn-group">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <span style="color: #333333" class="glyphicon glyphicon-export" aria-hidden="true"></span> <b>Export table</b> <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#" onClick ="$('#projSummary').tableExport({type:'json',escape:'false'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON</a></li>
                    <li><a href="#" onClick ="$('#projSummary').tableExport({type:'json',escape:'false',ignoreColumn:'[2,3]'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON (ignoreColumn)</a></li>
                    <li><a href="#" onClick ="$('#projSummary').tableExport({type:'json',escape:'true'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON (with Escape)</a></li>
                    <li class="divider"></li>
                    <li><a href="#" onClick ="$('#projSummary').tableExport({type:'xml',escape:'false'});"> <img src='<c:url value="/res/images/xml.png"/>' width='16px'> XML</a></li>
                    <li><a href="#" onClick ="$('#projSummary').tableExport({type:'sql'});"> <img src='<c:url value="/res/images/sql.png"/>' width='16px'> SQL</a></li>
                    <li class="divider"></li>
                    <li><a href="#" onClick ="$('#projSummary').tableExport({type:'excel',escape:'false'});"> <img src='<c:url value="/res/images/xls.png"/>' width='16px'> XLS</a></li>
                    <li><a href="#" onClick ="$('#projSummary').tableExport({type:'csv',escape:'false'});"> <img src='<c:url value="/res/images/csv.png"/>' width='16px'> CSV</a></li>
                    <li><a href="#" onClick ="$('#projSummary').tableExport({type:'txt',escape:'false'});"> <img src='<c:url value="/res/images/txt.png"/>' width='16px'> TXT</a></li>
                </ul>
            </div>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addProject">
                <span style="color: #333333" class="glyphicon glyphicon-plus" aria-hidden="true"></span> <b>New project</b>
            </button>
        </div>
    </div>
    <div id="projectSummary" class="col-md-12">
        <table id="projSummary" class="display">
            <thead>
                <tr>
                    <th style="text-align: left"><b>Name</b></th>
                    <th style="text-align: left"><b>Start Date</b></th>
                    <th style="text-align: left"><b>End Date</b></th>
                    <th style="text-align: left"><b>Type</b></th>
                    <th style="text-align: left"><b>Business Unit</b></th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody id="projTable">
                <c:forEach items="${projects}" var="project">
                <tr>
                    <form class="specificProject" action='<c:url value="openProject"/>' method="get">
                        <input type="hidden" name="getId" class="projId" value="${project.projectId}"/>
                        <td style="text-align: left" class="projectName"><a href="" class="projectnamelink" data-toggle="tooltip" data-placement="top" title="Click to view project tasks"><c:out value="${project.name}" /></a></td>
                    </form>
                    <td style="text-align: left" class="startDate"><c:out value="${project.start}" /></td>
                    <td style="text-align: left" class="endDate"><c:out value="${project.end}" /></td>
                    <td style="text-align: left" class="projType"><c:out value="${project.type}" /></td>
                    <td style="text-align: left" class="bUnit"><c:out value="${project.bUnit}" /></td>
                    <td><button class="btn btn-warning editOption" data-toggle="modal" data-target="#editProject">
                            <span style="color: #333333" class="glyphicon glyphicon-pencil" aria-hidden="true"></span> <b>Edit</b>
                        </button></td>
                    <td><button id="deleteButton3" class="btn btn-danger end" data-toggle="modal" data-target="#endProject">
                            <span style="color: #333333" class="glyphicon glyphicon-trash" aria-hidden="true"></span> <b>End</b>
                        </button></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
    
</div>
</div>
</div><!-- closing div from navigation-->

    <!-- Start modal for add project-->                
    <div class="modal fade" id="addProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Add Project</b>
                        </div>
                        <form id="add" name="add" action='<c:url value="addProject"/>' method="post" modelAttribute="project">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="">Name<font style="margin-left:20px;display:none;" color="red" id="error1"></font></label>
                                    <input class="form-control" autocomplete="off" required="required" id="name1" type="text" name="name" maxlength="30" pattern=".{4,30}" title="4 to 30 Characters">
                                </div>
                                <div class="form-group">
                                    <label for="">Start Date</label>
                                    <input class="form-control" type="date"  required="required" name="start" id="start1">
                                </div>
                                <div class="form-group">
                                    <label for="">End Date<font style="margin-left:20px;display:none;" color="red" id="error3"></font></label>
                                    <input class="form-control" type="date"  required="required" name="end" id="end1">
                                </div>
                                <div class="form-group">
                                    <label for="">Type</label>
                                    <select class="form-control" name="type" required="required" >
                                        <option disabled="true" selected default></option>
                                        <option value="Project-Based">Project-Based</option>
                                        <option value="Time and Material">Time and Material</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Business Unit</label>
                                    <select class="form-control" name="bUnit" required="required">
                                        <option disabled="true" selected default></option>
                                        <option value="Philippines">Philippines</option>
                                        <option value="Japan">Japan</option>
                                        <option value="Rest of the World">Rest of the World</option>
                                        <option value="Alliance">Alliance</option>
                                    </select>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <input value="Ongoing" name="status" hidden="hidden">
                                    <input value="Summary" name="reference" hidden="hidden">
                                    <button class="btn btn-success" id="add-but1" type="submit">
                                        <span style="color: #333333" class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span> <b>Submit</b>
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
    <!-- End modal for add project-->
    
    <!-- Start modal for edit project-->            
    <div class="modal fade" id="editProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>Edit Project</b>
                        </div>
                        <form id="edit" name="edit" action='<c:url value="editProjSumm"/>' method="post" modelAttribute="project">
                            <input type="hidden" name="projectId" id="editProjId" />
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="">Name<font style="margin-left:20px;display:none;" color="red" id="edit1"></font></label>
                                    <input class="form-control" autocomplete="off" required="required" id="field1" type="text" name="name" maxlength="30" pattern=".{4,30}" title="4 to 30 Characters">
                                </div>
                                <div class="form-group">
                                    <label for="">Start Date</label>
                                    <input class="form-control" type="date" id="field2" required="required" name="start">
                                </div>
                                <div class="form-group">
                                    <label for="">End Date<font style="margin-left:20px;display:none;" color="red" id="edit3"></font></label>
                                    <input class="form-control" type="date" id="field3" required="required" name="end">
                                </div>
                                <div class="form-group">
                                    <label for="">Type</label>
                                    <select class="form-control" name="type" required="required" id="field4">
                                        <option value="Project-Based">Project-Based</option>
                                        <option value="Time and Material">Time and Material</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Business Unit</label>
                                    <select class="form-control" name="bUnit" required="required" id="field5">
                                        <option value="Philippines">Philippines</option>
                                        <option value="Japan">Japan</option>
                                        <option value="Rest of the World">Rest of the World</option>
                                        <option value="Alliance">Alliance</option>
                                    </select>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right">
                                    <button class="btn btn-success" id="add-but2" type="submit">
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
    <!-- End modal for edit project-->
    
    <!-- Start modal for end project-->            
    <div class="modal fade" id="endProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog-s">
            <div class="modal-content-sm">
                <div class="modal-body-sm">
                    <div class="panel panel-primary">  
                        <div class="panel-heading">
                            <b>End Project</b>
                        </div>
                        <form id="del" name="del" action='<c:url value="delSummary"/>' method="post" modelAttribute="project">
                            <input type="hidden" name="projectId" id="delProjId"/>
                            <div class="panel-body">
                                <div class="form-group" style="text-align: center;">
                                    <br/>
                                    <label>Are you sure you want to end <b id="endName"></b>?</label>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div style="text-align: right;">
                                    <button class="btn btn-success" id="add-but" type="submit">
                                        <span style="color: #333333" class="glyphicon glyphicon-ok" aria-hidden="true"></span> <b>Yes</b>
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
    <!-- End modal for end project-->
    <script>
        $(document).ready(function(){
            $("#2").attr("class","active"); 
            $("#projSummary").dataTable();
            $(".projectnamelink").tooltip();
            
            $("#name1").change(function(){
                $("#error1").html("");
                $.ajax({
                    url:'nameExists.htm',
                    type:'post',
                    data:{'name':$(this).val()},
                    success:function(data,status){
                        if(data=="true"){
                            $("#error1").css("display","true");
                            $("#error1").text("Project Name Already Exist!");
                            $("#add-but1").attr("disabled","true");
                        }else{
                            if($("#error3").html()==""){
                                $("#add-but1").removeAttr("disabled");
                            }
                        }
                    }
                });
            });
            
            $("#end1").change(function(){
                $("#error3").html("");
                var startDate = new Date($("#start1").val());
                var endDate = new Date($(this).val());
                if(startDate>endDate){
                    $("#error3").css("display","true");
                    $("#error3").text("End date should be after or equal the start date.");
                    $("#add-but1").attr("disabled","true");
                }else{
                    if($("#error1").html()==""){
                        $("#add-but1").removeAttr("disabled");
                    }
                }
            });
            
            $("#start1").change(function(){
               $("#end1").change(); 
            });
           
           
            var selectedEditName="";
            $("#field1").change(function(){
                $("#edit1").html("");
                if(selectedEditName!=$(this).val()){
                    $.ajax({
                        url:'nameExists.htm',
                        type:'post',
                        data:{'name':$(this).val()},
                        success:function(data,status){
                            if(data=="true"){
                                $("#edit1").css("display","true");
                                $("#edit1").text("Name Already Exist!");
                                $("#add-but2").attr("disabled","true");
                            }else{
                                if($("#edit3").html()==""){
                                    $("#add-but2").removeAttr("disabled");
                                }
                            }
                        }
                    });
                }else{
                    if($("#edit3").html()==""){
                        $("#add-but2").removeAttr("disabled");
                    }
                }
            });
            
            $("#field2").change(function(){
                $("#field3").change();
            });
           
            $("#field3").change(function(){
                $("#edit3").html("");
                var startDate = new Date($("#field2").val());
                var endDate = new Date($(this).val());
                if(startDate>endDate){
                    $("#edit3").css("display","true");
                    $("#edit3").text("End date should be after or equal the start date.");
                    $("#add-but2").attr("disabled","true");
                }else{
                    if($("#edit1").html()==""){
                        $("#add-but2").removeAttr("disabled");
                    }
                }
            });
           
            $("#projTable").on("click",".end",function(){
                $("#endName").text($(this).parent().siblings(".projectName").text());
                $("#delProjId").val($(this).parent().siblings(".projId").val());
            });
           
            $("#projTable").on("click",".editOption",function(){ 
                selectedEditName=$(this).parent().siblings(".projectName").text();
                $("#add-but2").removeAttr("disabled");
               $("#edit1").html("");
               $("#edit3").html("");
               $("#editProjId").val($(this).parent().siblings(".projId").val());
               $("#field1").val($(this).parent().siblings(".projectName").text());
               $("#field2").val($(this).parent().siblings(".startDate").text());
               $("#field3").val($(this).parent().siblings(".endDate").text());
               $("#field4").val($(this).parent().siblings(".projType").text());
               $("#field5").val($(this).parent().siblings(".bUnit").text()); 
            });
        
            $("#projTable").on("click","a.projectnamelink",function(){
                $(this).parent().parent().find(".specificProject").submit();
                return false;
            });
        });
    </script>
    </body>
</html>