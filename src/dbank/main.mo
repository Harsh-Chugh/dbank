import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  var currentValue: Float = 300;
  currentValue := 100;

  let id = 2243435453;

  stable var startTime: Int = Time.now();
  startTime := Time.now();
  // Debug.print(debug_show(currentTime));
  

  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

  public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withDraw(amount: Float){

    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Insufficient Account Balance");
    }
  };

  public query func checkBalance(): async Float{
      return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedSec = (currentTime - startTime) / 1000000000;
    currentValue := currentValue * 1.01 ** Float.fromInt(timeElapsedSec);
    startTime := currentTime;
  }

}