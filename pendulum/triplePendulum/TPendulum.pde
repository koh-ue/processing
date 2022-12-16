class TPendulum{
  int SPEED = 10;
  float t;
  float dt;
  float[] theta;            //theta1,theta1_dot,theta2,theta2_dot,theta3,theta3_dot
  //FloatList[] theta_list;

  // Parameters
  float[] l = {200, 200, 200}; //{l1, l2, l3} 
  float[] m = {30, 30, 30}; //{m1, m2, m3}
  float g = 9.8;

  //float m12 = m1+m2;
  boolean typeL;
  boolean BandW;
  color col = 255;
  int colorNum;
  int colorBand = 720;
  
  int ellipseSize = 10;
  //constructer
  TPendulum(int FRAME_RATE, boolean type, boolean colorType){
    dt = (float)(1.0 / FRAME_RATE)*SPEED;
    typeL = type;
    BandW = colorType;
    if (BandW == false){
      colorMode(HSB, colorBand, 100, 100);//Hue: 0-720, Saturation: 0-100, Brightness: 0-100;
    }
  }
  
  void init(float val, int colnum){
    // set intial values
    theta = new float[6];
    //float val = random(2 * PI);
    theta[0] = val;
    theta[1] = 0;
    theta[2] = val;
    theta[3] = 0;
    theta[4] = val;
    theta[5] = 0;
    
    colorNum = colnum;
    //save the history of theta1,theta2
    //theta_list = new FloatList[2];
    //for (int i = 0; i < 2; i++ )
    //  theta_list[i] = new FloatList();
  }
  void update(){
    //update the data
    t += dt;
    theta = RK(dt, theta, t);
    if (BandW == false){
      col = color((colorNum % colorBand), 100, 100);
      colorNum++;
    }
  }
  
  void draw(){
    //calculate the positions
    float x1 = l[0]*sin(theta[0]);
    float y1 = (-l[0]*cos(theta[0]));
    float x2 = (x1 + l[1]*sin(theta[2]));
    float y2 = (y1 - l[1]*cos(theta[2]));
    float x3 = (x2 + l[2]*sin(theta[4]));
    float y3 = (y2 - l[2]*cos(theta[4]));
    //println(l[2]);
    //set color;
    
    if(typeL){
      stroke(col);
      //draw lines
      line(0, 0, x1, y1);
      line(x1, y1, x2, y2);
      line(x2, y2, x3, y3);
    } else {
      noStroke();
      fill(col);
      //draw points
      ellipse(x3, y3, ellipseSize, ellipseSize);
    }

    
  }
  
  
  /*Basic Functions for calculations*/
  float[] RK(float dt, float[] x, float t) {
    //Runge-Kutta

    // dt * dx(t_n,x_n)
    float[] dx_k1 = sv_mul(dt, dx(t, x));

    // dt * (dx(t_(n+0.5),x_(n+0.5))
    float[] dx_k2 = sv_mul(dt, dx(t+dt/2.0, vv_add(x, sv_mul(0.5, dx_k1))));

    // dt * (dx(t_(n+0.5),x_(n+0.5))
    float[] dx_k3 = sv_mul(dt, dx(t+dt/2.0, vv_add(x, sv_mul(0.5, dx_k2))));

    // dt * (dx(t_(n+1),x_(n+1))
    float[] dx_k4 = sv_mul(dt, dx(t+dt, vv_add(x, dx_k3)));

    //add
    x = vv_add(x, sv_mul(1.0/6.0, dx_k1));
    x = vv_add(x, sv_mul(2.0/6.0, dx_k2));
    x = vv_add(x, sv_mul(2.0/6.0, dx_k3));
    x = vv_add(x, sv_mul(1.0/6.0, dx_k4));

    return x;
  }

  float[] dx(float t, float[] x) {
    //bibun

    //result
    float[] ret = new float[x.length];

    //set values
    float[] th = {x[0], x[2], x[4]}; //{th1, th2, th3}
    float[] th_d = {x[1], x[3], x[5]}; //{th_d1, th_d2, th_d3}
    float[][] th_dd = new float[3][1];
    
    float[][] A = new float[3][3];
    float[][] B = new float[3][3];
    float[][] e = {{1}, {1}, {1}};
    for(int i=0; i<3; i++){
      for(int j=0; j<3; j++){
        float sum_m = 0;
        for(int k=max(i, j); k<=2; k++){
          sum_m += m[k];
        }
        A[i][j] = sum_m * l[j] * cos(th[i] - th[j]);
        
        if(i == j){
          B[i][j] = sum_m * g * sin(th[i]);
        } else {
          B[i][j] = sum_m * l[j] * th_d[j] * th_d[j] * sin(th[i] - th[j]);
        }
      }
    }
    
    th_dd = vv_mul(sv_mul2(-1, inv_mat3x3(A)), vv_mul(B, e));
    
    ret[0] = th_d[0];
    ret[1] = th_dd[0][0];
    ret[2] = th_d[1];
    ret[3] = th_dd[1][0];
    ret[4] = th_d[2];
    ret[5] = th_dd[2][0];
    /*
    float S = sin(x[0]-x[2]);
    float C = cos(x[0]-x[2]);
    float t1 = x[0];    // theta1
    float t1_d = x[1];  // theta1 dot
    float t2 = x[2];    // theta2
    float t2_d = x[3];  // theta2 dot
    float t3 = x[4];    // theta3
    float t3_d = x[5];  // theta3 dot

    ret[0] = t1_d;
    ret[1] = (g*(sin(t2)*C-m12/m2*sin(t1))-(l1*t1_d*t1_d*C+l2*t2_d*t2_d)*S)/(l1*(m12/m2-C*C));
    ret[2] = t2_d;
    ret[3] = (g*m12/m2*(C*sin(t1)-sin(t2))+(m12/m2*l1*t1_d*t1_d+l2*t2_d*t2_d*C)*S)/(l2*(m12/m2-C*C));
    */
    return ret;
  }

  float[] sv_mul(float s, float[] v) {
    //multiple
    float[] ret = new float[v.length];
  
    for (int i = 0; i < v.length; i++ )
      ret[i] = v[i] * s;
  
    return ret;
  }
  
  float[][] sv_mul2(float s, float[][] v) {
    //multiple
    float[][] ret = new float[v.length][v[0].length];
  
    for (int i = 0; i < v.length; i++ ){
      for (int j=0; j < v.length; j++){
        ret[i][j] = v[i][j] * s;
      }
    }
      
  
    return ret;
  }

  float[] sv_add(float s, float[] v) {
    //addition
    float[] ret = new float[v.length];
  
    for (int i = 0; i < v.length; i++ )
      ret[i] = v[i] + s;
  
    return ret;
  }
  
  float[] vv_add(float[] v1, float[] v2) {
    //addition
    float[] ret = new float[v1.length];
  
    for (int i = 0; i < v1.length; i++ )
      ret[i] = v1[i] + v2[i];
  
    return ret;
  }
  
  float[][] vv_mul(float[][] v1, float[][] v2){
    float[][] ret = new float[v1.length][v2[0].length];
    
    for(int i=0; i<v1.length; i++){
      for(int j=0; j<v2[0].length; j++){
        ret[i][j] = 0;
        for(int k=0; k<v1[0].length; k++){
          ret[i][j] += v1[i][k]*v2[k][j];
        }
      }
    }
    return ret;
  }
  
  float[][] inv_mat3x3(float[][] a){
    float[][] ret = new float[a.length][a.length];
    
    float s = 1/(a[0][0]*a[1][1]*a[2][2] + a[0][1]*a[1][2]*a[2][0] + a[0][2]*a[1][0]*a[2][1] - a[0][2]*a[1][1]*a[2][0] - a[0][1]*a[1][0]*a[2][2] - a[0][0]*a[1][2]*a[2][1]);
    
    float[][] mat = {{a[1][1]*a[2][2] - a[1][2]*a[2][1], -(a[0][1]*a[2][2] - a[0][2]*a[2][1]), a[0][1]*a[1][2] - a[0][2]*a[1][1]},
                     {-(a[1][0]*a[2][2] - a[1][2]*a[2][0]), a[0][0]*a[2][2] - a[0][2]*a[2][0], -(a[0][0]*a[1][2] - a[0][2]*a[1][0])},
                     {a[1][0]*a[2][1] - a[1][1]*a[2][0], -(a[0][0]*a[2][1] - a[0][1]*a[2][0]), a[0][0]*a[1][1] - a[0][1]*a[1][0]}};
                     
    ret = sv_mul2(s, mat);
    return ret;
  }
  float[][] transpose(float[][] x){
    int row, column;
    row = x.length;
    column = x[0].length;
    
    float[][] result = new float[column][row];
    
    for(int i=0; i<column; i++){
      for(int j=0; j<row; j++){
        result[i][j] = x[j][i];
      }
    }
    return result;
  }
  float[][] spritMatrix(float[][] x, int row, int column){
    int rowSize = x.length;
    int columnSize = x[0].length;
    float[][] result = new float[rowSize - 1][columnSize - 1];
    
    int m, n;
    
    m = 0;
    for(int i=0; i<rowSize; i++){
      if(i != row){
        n = 0;
        for(int j=0; j<columnSize; j++){
          if(j != column){
            result[m][n] = x[i][j];
            n++;
          }
        }
        m++;
      }
      
    }
    return result;
  }
  float determinant(float[][] x){
    int row, column;
    row = x.length;
    column = x[0].length;
    
    float det;
    
    if (row != column){
      return 0.0;
    } else if(row == 1){
      return x[0][0];
    } else if(row == 2){
      return x[0][0]*x[1][1] - x[0][1]*x[1][0];
    } else {
      det = 0;
      
      for(int i=0; i<row; i++){
        det += pow(-1, i+2) * x[i][0] * determinant(spritMatrix(x, i, 0));
      }
      return det;
    }
  }
  float[][] inverse(float[][] x){
    int row, column;
    row = x.length;
    column = x[0].length;
    
    float[][] result = new float[row][column];
    
    float[][] confactorMatrix = new float[row][column];
    
    for(int i=0; i<row; i++){
      for(int j=0; j<column; j++){
        confactorMatrix[i][j] = pow(-1, (i+1)+(j+1))*x[i][j]*determinant(spritMatrix(x, i, j));
      }
    }
    
    result = sv_mul2(1/determinant(x), transpose(confactorMatrix));
    
    return result;
  }
}
