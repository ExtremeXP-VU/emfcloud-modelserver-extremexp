<?xml version="1.0" encoding="UTF-8"?>
<workflow:Specification xmi:version="2.0" xmlns:xmi="http://www.omg.org/XMI" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xmlns:workflow="http://www.example.org/workflow"
xsi:schemaLocation="http://www.example.org/workflow workflow.ecore"
>
  <workflow>
    <node xsi:type="workflow:EventNode"/>
    <node xsi:type="workflow:Task" name="task" description="demo task" implementationRef="default string"/>
    <node xsi:type="workflow:EventNode" name="END"/>
    <link xsi:type="workflow:RegularLink" output="//@workflow/@node.1" input="//@workflow/@node.0"/>
    <link xsi:type="workflow:RegularLink" output="//@workflow/@node.2" input="//@workflow/@node.1"/>
  </workflow>
</workflow:Specification>