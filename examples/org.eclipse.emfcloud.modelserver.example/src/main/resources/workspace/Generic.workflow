<?xml version="1.0" encoding="UTF-8"?>
<workflow:Workflow xmi:version="2.0" xmlns:xmi="http://www.omg.org/XMI" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xmlns:workflow="http://www.example.org/workflow"
xsi:schemaLocation="http://www.example.org/workflow workflow.ecore"
>
  <node xsi:type="workflow:Task" name="Generic Task"/>
  <node xsi:type="workflow:EventNode" name="START"/>
  <node xsi:type="workflow:EventNode" name="END"/>
  <link xsi:type="workflow:RegularLink" output="//@node.0" input="//@node.1"/>
  <link xsi:type="workflow:RegularLink" output="//@node.2" input="//@node.0"/>
</workflow:Workflow>
