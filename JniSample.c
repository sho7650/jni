#include <stdio.h>
#include <string.h>
#include <math.h>
#include "JniSample.h"

JNIEXPORT jdouble JNICALL Java_JniSample_exp (JNIEnv *env, jobject obj, jdouble jd1) {
	return exp(jd1);
}

JNIEXPORT jboolean JNICALL Java_JniSample_strcmp (JNIEnv *env, jobject obj, jstring js0, jstring js1) {
	const char* s0 = (*env)->GetStringUTFChars(env, js0, NULL);
	const char* s1 = (*env)->GetStringUTFChars(env, js1, NULL);
	return !strcmp(s0, s1);
}

