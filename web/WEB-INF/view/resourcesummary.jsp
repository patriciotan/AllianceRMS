<%@include file="navigation.jsp" %>

<div id="bodiv">
    <div class="row page-header" style="margin-top: 0%;">
        <div style="float: left; width: 75%;">
            <ol class="breadcrumb">
                <li class="active">Resource Summary</li>
            </ol>
        </div>
        <div style="float: left;" class="pull-right">
            <div class="btn-group">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <span style="color: #333333" class="glyphicon glyphicon-export" aria-hidden="true"></span> <b>Export table</b> <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#" onClick ="$('#resSummary').tableExport({type:'json',escape:'false'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON</a></li>
                    <li><a href="#" onClick ="$('#resSummary').tableExport({type:'json',escape:'false',ignoreColumn:'[2,3]'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON (ignoreColumn)</a></li>
                    <li><a href="#" onClick ="$('#resSummary').tableExport({type:'json',escape:'true'});"> <img src='<c:url value="/res/images/json.png"/>' width='16px'> JSON (with Escape)</a></li>
                    <li class="divider"></li>
                    <li><a href="#" onClick ="$('#resSummary').tableExport({type:'xml',escape:'false'});"> <img src='<c:url value="/res/images/xml.png"/>' width='16px'> XML</a></li>
                    <li><a href="#" onClick ="$('#resSummary').tableExport({type:'sql'});"> <img src='<c:url value="/res/images/sql.png"/>' width='16px'> SQL</a></li>
                    <li class="divider"></li>
                    <li><a href="#" onClick ="$('#resSummary').tableExport({type:'excel',escape:'false'});"> <img src='<c:url value="/res/images/xls.png"/>' width='16px'> XLS</a></li>
                    <li><a href="#" onClick ="$('#resSummary').tableExport({type:'csv',escape:'false'});"> <img src='<c:url value="/res/images/csv.png"/>' width='16px'> CSV</a></li>
                    <li><a href="#" onClick ="$('#resSummary').tableExport({type:'txt',escape:'false'});"> <img src='<c:url value="/res/images/txt.png"/>' width='16px'> TXT</a></li>
                </ul>
            </div>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#summary">
                <span style="color: #333333" class="glyphicon glyphicon-plus" aria-hidden="true"></span> <b>Show head count</b>
            </button>
        </div>
    </div>
    <div id="resourceSummary" class="col-md-12">
        <div class="row">
            <!-- employee list table-->
                <table id="resSummary" class="display">   
                    <thead>
                        <tr>
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
                    <tbody id="resources">
                        <c:forEach items="${resources}" var="resource">
                        <tr class="resourceRow" data-toggle="modal" data-target="#resInfo" data-toggle="tooltip" data-placement="top" title="Click to view resource information">   
                            <input type="hidden" class="resId" value="${resource.empId}"/>
                            <td style="text-align: left;" class="resName"><c:out value="${resource.fname} ${resource.lname}" /></td>						
                            <td style="text-align: left"><c:out value="${resource.year}" /></td>   
                            <td style="text-align: left"><c:out value="${resource.jan}" /></td>   
                            <td style="text-align: left"><c:out value="${resource.feb}" /></td>   
                            <td style="text-align: left"><c:out value="${resource.mar}" /></td>   
                            <td style="text-align: left"><c:out value="${resource.apr}" /></td>   
                            <td style="text-align: left"><c:out value="${resource.may}" /></td>   
                            <td style="text-align: left"><c:out value="${resource.jun}" /></td>   
                            <td style="text-align: left"><c:out value="${resource.jul}" /></td>   
                            <td style="text-align: left"><c:out value="${resource.aug}" /></td>   
                            <td style="text-align: left"><c:out value="${resource.sep}" /></td>   
                            <td style="text-align: left"><c:out value="${resource.oct}" /></td>   
                            <td style="text-align: left"><c:out value="${resource.nov}" /></td>   
                            <td style="text-align: left"><c:out value="${resource.dece}" /></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            
            <!-- info Modal -->
                <div class="modal fade" id="resInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content-sm">
                            <div class="modal-body-sm">
                                <div class="panel panel-primary">  
                                    <div class="panel-heading">
                                        <b id="employeeName"></b>
                                    </div>
                                    <div class="panel-body">
                                        <table>
                                            <tbody>
                                                <tr><td><b>Business unit:<code id="resUnit"></code></b></td></tr>
                                                <tr><td><b>Date hired:<code id="resHired"></code></b><td></tr>
                                                <tr><td><b>Projects Assigned To:<br/><code id="currentProjects"></code></b></td></tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="panel-footer">
                                        <div style="text-align: right;">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">
                                                <span style="color: #333333" class="glyphicon glyphicon-remove" aria-hidden="true"></span> <b>Close</b>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- info Modal --> 
                    
            <!-- summary Modal -->
                <div class="modal fade" id="summary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="panel panel-primary"> 
                                    <div class="panel-heading">
                                        <b>Resources per Business Unit</b>
                                    </div>
                                    <div class="panel-body">
                                        <div id="chartContainer" style="height:390px;"></div>
                                    </div>
                                    <div class="panel-footer">
                                        <div style="text-align: right;">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">
                                                <span style="color: #333333" class="glyphicon glyphicon-remove" aria-hidden="true"></span> <b>Close</b>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- summary Modal -->  
            
            <!-- reminder Modal -->
                <div class="modal fade" id="reminder" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" style="width: 50%;">
                        <div class="modal-content-sm">
                            <div class="modal-body-sm">
                                <div class="panel panel-primary">  
                                    <div class="panel-heading">
                                        <b>Resources Load Reminder for ${month} ${year}</b>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-6">
                                            <table class="table table-hover display tablee">
                                                <thead>
                                                    <th style="text-align: left">Under load Employees</th>
                                                    <th style="text-align: right">Max effort</th>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${underload}" var="ul">
                                                    <tr>   
                                                        <td style="text-align: left;" class="resName"><c:out value="${ul.fname} ${ul.lname}" /></td>						
                                                        <td style="text-align: right"><c:out value="${ul.jan}" /></td>
                                                    </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-6">
                                            <table class="table table-hover display tablee">
                                                <thead>
                                                    <th style="text-align: left">Full load Employees</th>
                                                    <th style="text-align: right">Max effort</th>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${overload}" var="ol">
                                                    <tr>   
                                                        <td style="text-align: left;" class="resName"><c:out value="${ol.fname} ${ol.lname}" /></td>						
                                                        <td style="text-align: right"><c:out value="${ol.jan}" /></td>   
                                                    </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div style="text-align: right;">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">
                                                <span style="color: #333333" class="glyphicon glyphicon-remove" aria-hidden="true"></span> <b>Close</b>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- reminder Modal -->  
            
            
            
        </div>
    </div>
</div>

</div>
</div>
</div><!-- closing div from navigation-->
    </body>
    
    <script>
        $(document).ready(function(){
           $("#3").attr("class","active"); 
           $("#resSummary").dataTable();
           $('#reminder').modal('show');
           $(".resourceRow").tooltip();
           $('.tablee').DataTable({
                "order": [[ 1, "desc" ]],
                "scrollCollapse": true,
                "paging":         false,
                "bInfo":          false,
                "bFilter":        false
            });
           
            $("#resources").on('click',".resourceRow",function(){
               $.ajax({
                   url:'getSpecificEmployee.htm',
                   type:'post',
                   data:{'id':$(this).children(".resId").val()},
                   success:function(data,status){
                       $("#currentProjects").html("");
                       var x = data.toString();
                       var res=x.split("%");
                       $("#employeeName").text(res[0]+" "+res[1]+" "+res[2]);
                       $("#resUnit").text(res[3]);
                       $("#resHired").text(res[4]);
                       if(res.length==5){
                           $("#currentProjects").append("Currently not assigned to any project");
                       }
                       for(var i=5;i<res.length;i++){
                           $("#currentProjects").append(i-4+". "+res[i]+"<br/> ");
                       }
                   },  
                        error : function(e) {  
                        alert('Error: ' + e);   
                    }
                   
               });
           });
           
            new CanvasJS.Chart("chartContainer",
            {
            data: [
            {
                type: "pie",
                showInLegend: true,
                toolTipContent: "{y} - #percent %",
                dataPoints: [
                    {  y: ${summary.ph}, legendText:"Philippines", indexLabel: "Philippines" },
                    {  y: ${summary.jap}, legendText:"Japan", indexLabel: "Japan" },
                    {  y: ${summary.row}, legendText:"ROW", indexLabel: "Rest of the World" },
                    {  y: ${summary.alli}, legendText:"Alliance", indexLabel: "Alliance" },
                    {  y: ${summary.unassigned}, legendText:"Unassigned", indexLabel: "Unassigned" }
                ]
            }
            ]
            }).render();
        
        });
    </script>
</html>