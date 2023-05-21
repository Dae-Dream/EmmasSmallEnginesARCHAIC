﻿<%@ Page Title="Repair Tracker" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RepairTracker.aspx.cs" Inherits="EmmasSmallEngines.RepairTracker" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%--Michael Quill, Stephen Bodner--%>
	<div class="container">
		<h2 class="mt-3"><%: Title %></h2>

		<div class="card">
			<div class="card-body">
				<div class="row justify-content-center">
					<div id="tableContainer" runat="server">
						<asp:GridView ID="gvRepairs" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px" CssClass="table table-striped" DataKeyNames="id" DataSourceID="odsServiceOrders" OnSelectedIndexChanged="gvRepairs_SelectedIndexChanged" AllowPaging="True" AllowSorting="True" PageSize="5">
							<Columns>
								<asp:CommandField ShowSelectButton="True" />
								<asp:BoundField DataField="id" HeaderText="Order ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
								<asp:BoundField DataField="serordDateIn" DataFormatString="{0:d}" HeaderText="Date In" SortExpression="serordDateIn" />
								<asp:BoundField DataField="serordDateOut" DataFormatString="{0:d}" HeaderText="Date Out" SortExpression="serordDateOut" />
								<asp:CheckBoxField DataField="serordWarranty" HeaderText="Warranty" SortExpression="serordWarranty" />
								<asp:BoundField DataField="equipID" HeaderText="Equip ID" SortExpression="equipID" />
								<asp:BoundField DataField="empFullName" HeaderText="Technician" ReadOnly="True" SortExpression="empFullName" />
								<asp:BoundField DataField="serName" HeaderText="Service" SortExpression="serName" />
							</Columns>
						</asp:GridView>
					</div>
					<div id="btnContainer" runat="server" visible="false" class="col-12">
						<div class="col-12">
							<div class="row justify-content-center">
								<div class="col-auto">
									<asp:LinkButton ID="btnShowTable" OnClick="btnShowTable_Click" CausesValidation="false" CssClass="btn btn-primary" runat="server" Text="Show Repairs Table" />
								</div>
								<div class="col-2"></div>
								<div class="col-auto">
									<asp:LinkButton ID="btnUpdateTable" OnClick="btnUpdateTable_Click" ValidationGroup="updateGroup" CausesValidation="true" CssClass="btn btn-success" runat="server" Text="Update Repair Order" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr />

				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblDateIn" runat="server" Text="Date In" AssociatedControlID="txtDateIn" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtDateIn" Enabled="false" TextMode="Date" runat="server" CssClass="col-12" />
					</div>
					<div class="col-2">
						<asp:Label ID="lblDateOut" runat="server" Text="Date Out" AssociatedControlID="txtDateOut" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtDateOut" TextMode="Date" runat="server" CssClass="col-12" />
						<asp:RequiredFieldValidator ID="valDateOutReq" runat="server" ValidationGroup="updateGroup" ControlToValidate="txtDateOut" ErrorMessage="Date Out required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
					</div>
				</div>
				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblService" runat="server" Text="Service" AssociatedControlID="txtService" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtService" Enabled="false" runat="server" CssClass="col-12" />
					</div>
					<div class="col-2">
						<asp:Label ID="lblServiceDesc" runat="server" Text="Description" AssociatedControlID="txtServiceDesc" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtServiceDesc" Enabled="false" runat="server" CssClass="col-12" />
					</div>
				</div>
				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblEquipID" runat="server" Text="Equip. ID" AssociatedControlID="txtEquipID" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtEquipID" Enabled="false" runat="server" CssClass="col-12" />
					</div>
					<div class="col-2">
						<asp:Label ID="lblEquipType" runat="server" Text="Equip. Type" AssociatedControlID="txtEquipType" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtEquipType" Enabled="false" runat="server" CssClass="col-12" />
					</div>
				</div>
				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblEquipModel" runat="server" Text="Equip. Model" AssociatedControlID="txtEquipModel" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtEquipModel" Enabled="false" runat="server" CssClass="col-12" />
					</div>
					<div class="col-2">
						<asp:Label ID="lblEquipSerial" runat="server" Text="Equip. Serial" AssociatedControlID="txtEquipSerial" />
					</div>
					<div class="col-3">
						<asp:TextBox ID="txtEquipSerial" Enabled="false" runat="server" CssClass="col-12" />
					</div>
				</div>
				<div class="row mt-3 justify-content-center">
					<div class="col-2">
						<asp:Label ID="lblEmployee" runat="server" Text="Technician" AssociatedControlID="ddTech" />
					</div>
					<div class="col-3">
						<asp:DropDownList ID="ddTech" runat="server" DataSourceID="techEmployee" CssClass="col-12" DataTextField="empFullName" DataValueField="id" AppendDataBoundItems="True">
							<asp:ListItem Text="Select Tech" Value="-1" Enabled="true" />
						</asp:DropDownList>
						<asp:RequiredFieldValidator runat="server" ID="valServiceEmployeeReq" ValidationGroup="updateGroup" ControlToValidate="ddTech" ErrorMessage="*" ForeColor="Red" Display="Dynamic" />
						<asp:CompareValidator runat="server" ID="valServiceEmployeeComp" ValidationGroup="updateGroup" ControlToValidate="ddTech" ErrorMessage="Select an employee." ForeColor="Red" Operator="NotEqual" ValueToCompare="-1" Display="Dynamic"></asp:CompareValidator>
					</div>
					<div class="col-2">
						<asp:Label ID="lblWarranty" runat="server" Text="Warranty" />
					</div>
					<div class="col-3">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<asp:LinkButton ID="btnWarrantyNo" CssClass="btn btn-danger btn-sm active" runat="server" Text="No" />
							<asp:LinkButton ID="btnWarrantyYes" CssClass="btn btn-secondary btn-sm" runat="server" Text="Yes" />
						</div>
					</div>
				</div>
				<div class="row mt-3 justify-content-center">
					<div class="col-auto">
						<asp:Label ID="lblDescription" runat="server" Text="Description" AssociatedControlID="txtDescription" /><br />
						<asp:TextBox ID="txtDescription" TextMode="MultiLine" Columns="40" runat="server"></asp:TextBox><br />
					</div>
					<div class="col-2">
					</div>
					<div class="col-2">
						<div class="row mt-1">
							<asp:LinkButton ID="btnStartTimer" OnClick="btnStartTimer_Click" CausesValidation="true" CssClass="btn btn-primary btn-block" runat="server" Text="Start Timer" />
						</div>
						<div class="row mt-1">
							<asp:LinkButton ID="btnPauseTimer" OnClick="btnPauseTimer_Click" CausesValidation="true" CssClass="btn btn-info btn-block" runat="server" Text="Pause Timer" />
						</div>
						<div class="row mt-1">
							<asp:LinkButton ID="btnResetTimer" OnClick="btnResetTimer_Click" CausesValidation="true" CssClass="btn btn-danger btn-block" runat="server" Text="Reset Timer" />
						</div>
					</div>
					<div class="col-2">
						<asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="1000" />

						<asp:UpdatePanel ID="pnlTimer" runat="server" UpdateMode="Conditional">
							<Triggers>
								<asp:AsyncPostBackTrigger ControlID="Timer1" />
							</Triggers>
							<ContentTemplate>
								Hours Worked:
									<h2>
										<asp:Label ID="lblTimerDisplay" runat="server"></asp:Label></h2>

							</ContentTemplate>
						</asp:UpdatePanel>
					</div>
				</div>
			</div>
		</div>

	</div>
	<asp:ObjectDataSource ID="odsServiceOrders" runat="server" DataObjectTypeName="System.Data.DataRow" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.RepairTrackerDataSetTableAdapters.ServiceOrderTableAdapter" UpdateMethod="Update"></asp:ObjectDataSource>
	<asp:ObjectDataSource ID="techEmployee" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmasLibrary.RepairsPageDataSetTableAdapters.EmployeeTableAdapter"></asp:ObjectDataSource>
</asp:Content>
