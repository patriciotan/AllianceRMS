<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="navigation.jsp" %>

<div id="bodiv">
    <div class="row page-header" style="margin-top: 0%;">
        <div style="float: left; width: 100%;">
            <ol class="breadcrumb">
                <li class="active">Dashboard</li>
            </ol>
        </div>
    </div>
    <div id="boards">
    <div class="row">
        <div class="col-md-4 col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading"><a href="rSummary" class="pull-right">View more</a> <h5><b>Under loaded resources for ${month}</b></h5></div>
                <div class="panel-body">
                    <ul id="underl" class="list-group">
                        <c:forEach items="${underload}" var="ul">
                        <li class="list-group-item" style="padding-left:5px;padding-right:5px;height:60px;">
                            <code>${ul.fname} ${ul.lname}</code>
                            <div class="progress progress-striped active">
                                <div class="progress-bar" style="min-width: 1em;" role="progressbar" aria-valuenow=${ul.jan} aria-valuemin="0" aria-valuemax="100" width="">
                                    ${ul.jan}
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="well"> 
                <form class="form">
                    <h5><b>Add new project</b></h5>
                    <br/>
                    <div style="width: 100%" class="input-group text-center">
                        <button style="width: 80%;" class="btn btn-primary" type="button" data-toggle="modal" data-target="#addProject">
                            <span style="color: #333333" class="glyphicon glyphicon-plus" aria-hidden="true"></span> <b>New project</b>
                        </button>
                    </div>
                    <br/>
                </form>
                <br/>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading"><a href="pSummary" class="pull-right">View more</a> <h5><b>Latest projects added</b></h5></div>
                <div class="panel-body">
                    <div>
                        <ol class="list-group">
                            <c:forEach end="2" items="${projects}" var="project">
                            <li class="list-group-item">
                                <span class="badge">${project.addedDate}</span>
                                <code>${project.name}</code>
                            </li>
                            </c:forEach>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading"><a href="pSummary" class="pull-right">View more</a> <h5><b>Projects ending this month</b></h5></div>
                <div class="panel-body">
                    <div>
                        <ol class="list-group">
                            <c:forEach end="2" items="${unPro}" var="up">
                            <li class="list-group-item">
                                <span class="badge">${up.end}</span>
                                <code>${up.name}</code>
                            </li>
                            </c:forEach>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>

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
                                    <input class="form-control" autocomplete="off" required="required"  type="text" name="name" id="name1" maxlength="30" pattern=".{4,30}" title="4 to 30 Characters">
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
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End modal for add project-->


</div>
</div>
</div><!-- closing div from navigation-->


    <script>
        $(document).ready(function(){
            $("#0").attr("class","active");
            
            $("#cname1").change(function(){
                $("#cerror1").html("");
                $.ajax({
                    url:'clientExists.htm',
                    type:'post',
                    data:{'name':$(this).val()},
                    success:function(data,status){
                        if(data=="true"){
                            $("#cerror1").css("display","true");
                            $("#cerror1").text("Client Name Already Exist!");
                            $("#add-but").attr("disabled","true");
                        }else{
                            $("#add-but").removeAttr("disabled");
                        }
                    }
                });
            });
            
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
            
            $('.table').DataTable({
                "order": [[ 1, "desc" ]],
                "scrollCollapse": true,
                "paging":         false,
                "bInfo":          false,
                "bFilter":        false
            });
            
            $('ul li').each(function(){
                var effort = parseInt($(this).children().next().children().html());
                $(this).find('.progress-bar').css('width', effort+'%');
                effort = effort/100;
                $(this).children().next().children().html(effort);
            });

        });
    </script>
</html>