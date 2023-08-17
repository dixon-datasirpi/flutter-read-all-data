package com.example.flutter_application_1

import android.accounts.Account
import android.accounts.AccountManager
import android.os.Bundle
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val CHANNEL = "READ_ACCOUNTS"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {  // Add the @NonNull annotation
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "readAccountInfo") {
                val accountManager = AccountManager.get(this@MainActivity)
                val accounts = accountManager.getAccountsByType(null)
                if (accounts.isEmpty()) {
                    Log.d("MainActivity", "No accounts found.")
                }
                val accountInfo = mutableMapOf<String, String>()
                if (accounts.isNotEmpty()) {
                    val accountList = mutableListOf<Map<String, String>>()
                
                    for (account in accounts) {
                        val accountMap = mutableMapOf<String, String>()
                        accountMap["accountName"] = account.name
                        accountMap["accountIdentifier"] = "${account.type}:${account.name}"
                        accountList.add(accountMap)
                    }
                
                    accountInfo["accounts"] = accountList.toString()
                } else {
                    accountInfo["accounts"] = "[]"
                }
                
                result.success(accountInfo)
            
            } else {
                result.notImplemented()
            }
        }
    }
}
