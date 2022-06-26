/**
* Ipos ��ӡ����ص�
* IPosPrinterCallback.aidl
* AIDL Version��1.0.0
*/
package com.iposprinter.iposprinterservice;

/**
 * ��ӡ����ִ�н���Ļص�
 */

interface IPosPrinterCallback {

	/**
	* ����ִ�н��
	* @param isSuccess:	  trueִ�гɹ���false ִ��ʧ��
	*/
	oneway void onRunResult(boolean isSuccess);

	/**
	* ���ؽ��(�ַ�������)
	* @param result:	�������ӡ���ϵ�������ӡ����(��λmm)
	*/
	oneway void onReturnString(String result);
}
