<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="OOTD.Azure" generation="1" functional="0" release="0" Id="c0ba8e80-d607-41f3-8363-978c1281ee51" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="OOTD.AzureGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="OOTD:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/OOTD.Azure/OOTD.AzureGroup/LB:OOTD:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="OOTD:APPINSIGHTS_INSTRUMENTATIONKEY" defaultValue="">
          <maps>
            <mapMoniker name="/OOTD.Azure/OOTD.AzureGroup/MapOOTD:APPINSIGHTS_INSTRUMENTATIONKEY" />
          </maps>
        </aCS>
        <aCS name="OOTD:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/OOTD.Azure/OOTD.AzureGroup/MapOOTD:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="OOTDInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/OOTD.Azure/OOTD.AzureGroup/MapOOTDInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:OOTD:Endpoint1">
          <toPorts>
            <inPortMoniker name="/OOTD.Azure/OOTD.AzureGroup/OOTD/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapOOTD:APPINSIGHTS_INSTRUMENTATIONKEY" kind="Identity">
          <setting>
            <aCSMoniker name="/OOTD.Azure/OOTD.AzureGroup/OOTD/APPINSIGHTS_INSTRUMENTATIONKEY" />
          </setting>
        </map>
        <map name="MapOOTD:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/OOTD.Azure/OOTD.AzureGroup/OOTD/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapOOTDInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/OOTD.Azure/OOTD.AzureGroup/OOTDInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="OOTD" generation="1" functional="0" release="0" software="C:\Users\mjlee\Downloads\OOTD (1)\OOTD\OOTD.Azure\csx\Release\roles\OOTD" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="APPINSIGHTS_INSTRUMENTATIONKEY" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;OOTD&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;OOTD&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/OOTD.Azure/OOTD.AzureGroup/OOTDInstances" />
            <sCSPolicyUpdateDomainMoniker name="/OOTD.Azure/OOTD.AzureGroup/OOTDUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/OOTD.Azure/OOTD.AzureGroup/OOTDFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="OOTDUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="OOTDFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="OOTDInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="32fef267-9e09-450f-9e4f-fb31bde8a8d0" ref="Microsoft.RedDog.Contract\ServiceContract\OOTD.AzureContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="55b37732-1239-441e-ba2e-518c97319b7d" ref="Microsoft.RedDog.Contract\Interface\OOTD:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/OOTD.Azure/OOTD.AzureGroup/OOTD:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>