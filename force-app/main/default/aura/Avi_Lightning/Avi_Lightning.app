<aura:application extends="force:slds">
    <aura:attribute name="OpenRegistrationForm" type="Boolean" default="flase" />
    <aura:attribute name="ButtonLabel" type="String"  default="Open Registration Form" />
    
    <c:Registration_Component /> 
    <!--c:DataAction /-->
    
    <!--
    <lightning:button label="{!v.ButtonLabel}" onclick="{!c.OpenOrCloseRegistrationForm}" />
    <aura:if isTrue="{!v.OpenRegistrationForm}">
        <c:Registration_Component />
    </aura:if>
    -->         
    <!-- c:SpinnerComponent / -->
    <!-- c:flowStagesfield /-->
    <!-- c:BackgroundUtilityComponent / -->
    <!-- c:ParentComponentController / -->
    
</aura:application>