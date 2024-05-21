<?xml version="1.0" encoding="UTF-8"?>
<workflow:Specification xmi:version="2.0" 
xmlns:xmi="http://www.omg.org/XMI" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xmlns:workflow="http://www.example.org/workflow"
xsi:schemaLocation="http://www.example.org/workflow workflow.ecore"
>
   <workflow>
    <node xsi:type="workflow:EventNode"/>
    <node xsi:type="workflow:Task" name="abstract task"/>
    <node xsi:type="workflow:EventNode" name="END"/>
    <link xsi:type="workflow:RegularLink" output="//@workflow.0/@node.1" input="//@workflow.0/@node.0"/>
    <link xsi:type="workflow:RegularLink" output="//@workflow.0/@node.2" input="//@workflow.0/@node.1"/>
  </workflow>
  <deployedworkflow workflow="//@workflow.0">
    <configuredtask name="version 1" configuration="//@workflow.0/@node.1"/>
    <configuredtask name="version 2" configuration="//@workflow.0/@node.1"/>
  </deployedworkflow>
</workflow:Specification>