import processing.pdf.*;

int nodeCount;
Node[] nodes = new Node[100];
HashMap nodeTable = new HashMap();

int edgeCount;
Edge[] edges = new Edge[500];

static final color selectColor = #FF3030;
static final color fixedColor  = #FF8080;
static final color edgeColor   = #000000;
static final int minimum_size = 2;

PFont font;

void setup() {
  size(1000, 700);  
  loadData();
  font = createFont("Meiryo UI", 10);
  textFont(font);  
  smooth();
}

void loadData() {
  String[] lines = loadStrings("sample.txt");
  String[] data;
  
  for(int i = 0; i < lines.length; i++){
    data = split(lines[i], ',');     
    addEdge(data[0], data[1]);
  }  
}

void addEdge(String fromLabel, String toLabel) {
  Node from = findNode(fromLabel);
  Node to = findNode(toLabel);
  from.increment();
//  from.fixed = true;
  from.nodeColor = #FFFFFF;
  to.nodeColor = #FF0000;
  to.increment();
  
  for (int i = 0; i < edgeCount; i++) {
    if (edges[i].from == from && edges[i].to == to) {
      edges[i].increment();
      return;
    }
  } 
  
  Edge e = new Edge(from, to);
  e.increment();
  if(edgeCount == edges.length){
    edges = (Edge[]) expand(edges);
  }
  edges[edgeCount++] = e;
}

Node findNode(String label) {
  label = label.toLowerCase();
  Node n = (Node) nodeTable.get(label);
  if (n == null) {
    return addNode(label);
  }
  return n;
}

Node addNode(String label){
  Node n = new Node(label);  
  if(nodeCount == nodes.length){
    nodes = (Node[]) expand(nodes);
  }
  nodeTable.put(label, n);
  nodes[nodeCount++] = n;
  return n;
}

void draw() {
  if (record) {
    beginRecord(PDF, "output.pdf");
  }
  
  background(#FFFFFF);

  for(int i = 0; i < edgeCount; i++){
    edges[i].relax();
  }
  for(int i = 0; i < nodeCount; i++){
    nodes[i].relax();
  }
  for(int i = 0; i < nodeCount; i++){
    nodes[i].update();
  }
  for (int i = 0; i < edgeCount ; i++){
    if(edges[i].from.count >= 3 && 
       edges[i].to.count >= 3){
      edges[i].draw();
    }
  }
  for(int i = 0; i < nodeCount; i++){
    if(nodes[i].count >= 3){
      nodes[i].draw();
    }
  }
  
  if(record){
    endRecord();
    record = false;
  }
}

boolean record;

void keyPressed(){
  if(key == 'r'){
    record = true;
  }
}

Node selection; 

void mousePressed() {
  float closest = 20;
  for(int i = 0; i < nodeCount; i++){
    Node n = nodes[i];
    float d = dist(mouseX, mouseY, n.x, n.y);
    if(d < closest){
      selection = n;
      closest = d;
    }
  }
  if(selection != null){
    if(mouseButton == LEFT){
      selection.fixed = true;
    }else if(mouseButton == RIGHT){
      selection.fixed = false;
    }
  }
}

void mouseDragged(){
  if(selection != null){
    selection.x = mouseX;
    selection.y = mouseY;
  }
}

void mouseReleased(){
  selection = null;
}

