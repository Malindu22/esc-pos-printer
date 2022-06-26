package com.example.testaidl;

import androidx.appcompat.app.AppCompatActivity;

import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.iposprinter.iposprinterservice.IPosPrinterCallback;
import com.iposprinter.iposprinterservice.IPosPrinterService;

public class MainActivity extends AppCompatActivity {

    IPosPrinterService iPosPrinterService;

    private ServiceConnection mConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            iPosPrinterService = IPosPrinterService.Stub.asInterface(iBinder);
        }

        @Override
        public void onServiceDisconnected(ComponentName componentName) {
            iPosPrinterService = null;
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Intent intent = new Intent();
        intent.setPackage("com.iposprinter.iposprinterservice");
        intent.setAction("com.iposprinter.iposprinterservice.IPosPrintService");
        bindService(intent,mConnection,BIND_AUTO_CREATE);

        Button inintBtn = findViewById(R.id.init);
        Button statusBtn = findViewById(R.id.status);
        Button print = findViewById(R.id.print);

        inintBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(getApplicationContext(),"click",Toast.LENGTH_SHORT);
                try {

                    iPosPrinterService.printerInit((IPosPrinterCallback) mCallback);
                }catch (Exception exception){
                    Toast.makeText(getApplicationContext(), (CharSequence) exception,Toast.LENGTH_SHORT).show();
                }
            }
        });

        statusBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(getApplicationContext(),"status",Toast.LENGTH_SHORT);
                try {
                   int data = iPosPrinterService.getPrinterStatus();
                    Toast.makeText(getApplicationContext(),"status"+ data,Toast.LENGTH_SHORT);
                }catch (Exception exception){
                    Toast.makeText(getApplicationContext(), (CharSequence) exception,Toast.LENGTH_SHORT).show();
                }
            }
        });

        print.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(getApplicationContext(),"click print",Toast.LENGTH_SHORT);
                try {
                    iPosPrinterService.printText("Hello world EEE", (IPosPrinterCallback) mCallback);
                    iPosPrinterService.printerFeedLines(2,mCallback);
                    iPosPrinterService.printBlankLines(2,2,mCallback);
                    iPosPrinterService.printerPerformPrint(4,mCallback);
                }catch (Exception exception){
                    Toast.makeText(getApplicationContext(), (CharSequence) exception,Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
    private IPosPrinterCallback mCallback = new IPosPrinterCallback.Stub() {
        @Override
        public void onRunResult(boolean isSuccess) throws RemoteException {
            Toast.makeText(getApplicationContext(), "Success"+isSuccess,Toast.LENGTH_SHORT).show();

        }

        @Override
        public void onReturnString(String result) throws RemoteException {
            Toast.makeText(getApplicationContext(), "return"+result,Toast.LENGTH_SHORT).show();
        }
    };
}