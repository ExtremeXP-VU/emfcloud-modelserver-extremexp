<?xml version="1.0" encoding="UTF-8"?>
<workflow:Specification xmi:version="2.0" 
xmlns:xmi="http://www.omg.org/XMI" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xmlns:workflow="http://www.example.org/workflow"
xsi:schemaLocation="http://www.example.org/workflow workflow.ecore"
>
  <parametertypes xsi:type="workflow:PrimitiveType" name="Integer"/>
  <parametertypes xsi:type="workflow:PrimitiveType" name="String" type="STRING"/>
  <workflow name="Main">
    <node xsi:type="workflow:EventNode"/>
    <node xsi:type="workflow:Task" name="T1">
      <inputs xsi:type="workflow:ExternalInputData" name="outcome"/>
      <generates outputdata="//@workflow.0/@node.1/@outputs.0"/>
      <outputs name="mean"/>
    </node>
    <node xsi:type="workflow:Task" name="T2"/>
    <node xsi:type="workflow:EventNode" name="END"/>
    <node xsi:type="workflow:Parallel"/>
    <node xsi:type="workflow:Exclusive">
      <condition>
        <cases case="a == b" target="//@workflow.0/@node.1"/>
        <cases case="a != b" target="//@workflow.0/@node.2"/>
      </condition>
    </node>
    <node xsi:type="workflow:Inclusive">
      <conditions>
        <cases case="x ==y" target="//@workflow.0/@node.1"/>
      </conditions>
      <conditions>
        <cases case="x != y" target="//@workflow.0/@node.2"/>
      </conditions>
    </node>
    <node xsi:type="workflow:InclusiveJoin"/>
    <link xsi:type="workflow:RegularLink" output="//@workflow.0/@node.1" input="//@workflow.1/@node.0"/>
    <link xsi:type="workflow:RegularLink" output="//@workflow.0/@node.2" input="//@workflow.0/@node.1"/>
    <link xsi:type="workflow:RegularLink" output="//@workflow.1/@node.2" input="//@workflow.0/@node.2"/>
  </workflow>
  <workflow name="T1-1">
    <node xsi:type="workflow:EventNode"/>
    <node xsi:type="workflow:Task" name="T3"/>
    <node xsi:type="workflow:EventNode" name="END"/>
    <link xsi:type="workflow:RegularLink" output="//@workflow.1/@node.1" input="//@workflow.0/@node.0"/>
    <link xsi:type="workflow:RegularLink" output="//@workflow.0/@node.3" input="//@workflow.1/@node.1"/>
  </workflow>
  <deployedworkflow workflow="//@workflow.0">
    <configuredtask name="T1-1" configuration="//@workflow.0/@node.1"/>
    <configuredtask name="T2-1" configuration="//@workflow.0/@node.2">
      <parameters xsi:type="workflow:StaticParameter" name="alpha" type="//@parametertypes.0" value="0.5"/>
    </configuredtask>
  </deployedworkflow>
  <deployedworkflow workflow="//@workflow.0">
    <configuredtask name="T1-1" configuration="//@workflow.0/@node.1"/>
    <configuredtask name="T2-2" configuration="//@workflow.0/@node.2"/>
  </deployedworkflow>
  <deployedworkflow workflow="//@workflow.0">
    <configuredtask name="T1-2" configuration="//@workflow.0/@node.1">
      <parameters xsi:type="workflow:StaticParameter" name="data input" type="//@parametertypes.1" value="some string"/>
    </configuredtask>
    <configuredtask name="T2-1" configuration="//@workflow.0/@node.2">
      <parameters xsi:type="workflow:StaticParameter" name="alpha" type="//@parametertypes.0" value="0.5"/>
    </configuredtask>
  </deployedworkflow>
  <deployedworkflow workflow="//@workflow.0">
    <configuredtask name="T1-2" configuration="//@workflow.0/@node.1"/>
    <configuredtask name="T2-2" configuration="//@workflow.0/@node.2"/>
  </deployedworkflow>
  <deployedworkflow workflow="//@workflow.1">
    <configuredtask name="T3-1" configuration="//@workflow.1/@node.1"/>
  </deployedworkflow>
  <deployedworkflow workflow="//@workflow.1">
    <configuredtask name="T3-2" configuration="//@workflow.1/@node.1"/>
  </deployedworkflow>
  <experimentspace deployedworkflow="//@deployedworkflow.5">
    <parameterdomain name="T2-1-p1-v1" type="//@parametertypes.0" value="0.5" staticparameter="//@deployedworkflow.0/@configuredtask.1/@parameters.0"/>
    <parameterdomain name="T2-1-p1-v2" type="//@parametertypes.0" value="0.8" staticparameter="//@deployedworkflow.0/@configuredtask.1/@parameters.0"/>
  </experimentspace>
  <experimentspace deployedworkflow="//@deployedworkflow.2">
    <parameterdomain name="T1-2-p1-v1" type="//@parametertypes.1" value="some string" staticparameter="//@deployedworkflow.2/@configuredtask.0/@parameters.0"/>
    <parameterdomain name="T1-2-p1-v2" type="//@parametertypes.1" value="some other string" staticparameter="//@deployedworkflow.2/@configuredtask.0/@parameters.0"/>
    <parameterdomain name="T2-1-p1-v1" type="//@parametertypes.0" value="0.5" staticparameter="//@deployedworkflow.0/@configuredtask.1/@parameters.0"/>
  </experimentspace>
</workflow:Specification>