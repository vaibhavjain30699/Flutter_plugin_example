package com.vaibhav.fluttertesting;

import android.annotation.TargetApi;
import android.os.Build;
import android.os.Environment;
import android.util.Log;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FluttertestingPlugin */
public class FluttertestingPlugin implements FlutterPlugin, MethodCallHandler {
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    final MethodChannel channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "fluttertesting");
    channel.setMethodCallHandler(new FluttertestingPlugin());
  }

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "fluttertesting");
    channel.setMethodCallHandler(new FluttertestingPlugin());
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getDownloadsDirPath")) {
//      result.success("Android " + android.os.Build.VERSION.RELEASE);
      String path;
      try{
        path = getDownloadsDir();
        result.success(path);
      }catch (Exception e){
        Log.e("downloads-path-provider","Error : " + e.getMessage());
        result.error("Error","Error while getting the path. Message " + e.getMessage(),null);
      }
    } else {
      result.notImplemented();
    }
  }

  @TargetApi(Build.VERSION_CODES.FROYO)
  private String getDownloadsDir(){
    return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS).toString();
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
  }
}
