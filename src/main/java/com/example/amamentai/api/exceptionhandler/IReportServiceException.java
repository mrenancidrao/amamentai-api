package com.example.amamentai.api.exceptionhandler;

public class IReportServiceException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6352957262874385789L;

	/**
	 * 
	 */
	public IReportServiceException() {
		super();
	}

	/**
	 * @param arg0
	 */
	public IReportServiceException(String arg0) {
		super(arg0);
	}

	/**
	 * @param arg0
	 */
	public IReportServiceException(Throwable arg0) {
		super(arg0);
	}

	/**
	 * @param arg0
	 * @param arg1
	 */
	public IReportServiceException(String arg0, Throwable arg1) {
		super(arg0, arg1);
	}

}
