package generatedtest;

import android.net.Uri;
import android.os.Parcel;
import java.io.File;
import java.util.List;
import java.util.Set;

// Test case generated by GenerateFlowTestCase.ql
public class Test {

	Object source() { return null; }
	void sink(Object o) { }

	public void test() throws Exception {

		{
			// "android.net;Uri$Builder;true;appendEncodedPath;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.appendEncodedPath(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;appendEncodedPath;;;Argument[0];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.appendEncodedPath(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;appendPath;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.appendPath(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;appendPath;;;Argument[0];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.appendPath(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;appendQueryParameter;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.appendQueryParameter(null, null);
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;appendQueryParameter;;;Argument[0..1];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.appendQueryParameter(null, in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;appendQueryParameter;;;Argument[0..1];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.appendQueryParameter(in, null);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;authority;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.authority(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;authority;;;Argument[0];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.authority(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;build;;;Argument[this];ReturnValue;taint;manual"
			Uri out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.build();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;clearQuery;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.clearQuery();
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;encodedAuthority;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.encodedAuthority(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;encodedAuthority;;;Argument[0];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.encodedAuthority(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;encodedFragment;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.encodedFragment(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;encodedFragment;;;Argument[0];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.encodedFragment(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;encodedOpaquePart;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.encodedOpaquePart(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;encodedOpaquePart;;;Argument[0];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.encodedOpaquePart(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;encodedPath;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.encodedPath(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;encodedPath;;;Argument[0];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.encodedPath(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;encodedQuery;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.encodedQuery(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;encodedQuery;;;Argument[0];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.encodedQuery(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;fragment;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.fragment(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;fragment;;;Argument[0];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.fragment(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;opaquePart;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.opaquePart(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;opaquePart;;;Argument[0];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.opaquePart(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;path;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.path(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;path;;;Argument[0];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.path(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;query;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.query(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;query;;;Argument[0];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.query(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;scheme;;;Argument[this];ReturnValue;value;manual"
			Uri.Builder out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.scheme(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "android.net;Uri$Builder;true;scheme;;;Argument[0];Argument[this];taint;manual"
			Uri.Builder out = null;
			String in = (String)source();
			out.scheme(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri$Builder;true;toString;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri.Builder in = (Uri.Builder)source();
			out = in.toString();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;false;decode;;;Argument[0];ReturnValue;taint;manual"
			String out = null;
			String in = (String)source();
			out = Uri.decode(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;false;encode;;;Argument[0];ReturnValue;taint;manual"
			String out = null;
			String in = (String)source();
			out = Uri.encode(in, null);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;false;encode;;;Argument[0];ReturnValue;taint;manual"
			String out = null;
			String in = (String)source();
			out = Uri.encode(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;false;fromFile;;;Argument[0];ReturnValue;taint;manual"
			Uri out = null;
			File in = (File)source();
			out = Uri.fromFile(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;false;fromParts;;;Argument[0..2];ReturnValue;taint;manual"
			Uri out = null;
			String in = (String)source();
			out = Uri.fromParts(null, null, in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;false;fromParts;;;Argument[0..2];ReturnValue;taint;manual"
			Uri out = null;
			String in = (String)source();
			out = Uri.fromParts(null, in, null);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;false;fromParts;;;Argument[0..2];ReturnValue;taint;manual"
			Uri out = null;
			String in = (String)source();
			out = Uri.fromParts(in, null, null);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;false;parse;;;Argument[0];ReturnValue;taint;manual"
			Uri out = null;
			String in = (String)source();
			out = Uri.parse(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;false;withAppendedPath;;;Argument[0..1];ReturnValue;taint;manual"
			Uri out = null;
			Uri in = (Uri)source();
			out = Uri.withAppendedPath(in, null);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;false;withAppendedPath;;;Argument[0..1];ReturnValue;taint;manual"
			Uri out = null;
			String in = (String)source();
			out = Uri.withAppendedPath(null, in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;false;writeToParcel;;;Argument[1];Argument[0];taint;manual"
			Parcel out = null;
			Uri in = (Uri)source();
			Uri.writeToParcel(out, in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;buildUpon;;;Argument[this];ReturnValue;taint;manual"
			Uri.Builder out = null;
			Uri in = (Uri)source();
			out = in.buildUpon();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getAuthority;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getAuthority();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getEncodedAuthority;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getEncodedAuthority();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getEncodedFragment;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getEncodedFragment();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getEncodedPath;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getEncodedPath();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getEncodedQuery;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getEncodedQuery();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getEncodedSchemeSpecificPart;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getEncodedSchemeSpecificPart();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getEncodedUserInfo;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getEncodedUserInfo();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getFragment;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getFragment();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getHost;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getHost();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getLastPathSegment;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getLastPathSegment();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getPath;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getPath();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getPathSegments;;;Argument[this];ReturnValue;taint;manual"
			List out = null;
			Uri in = (Uri)source();
			out = in.getPathSegments();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getQuery;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getQuery();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getQueryParameter;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getQueryParameter(null);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getQueryParameterNames;;;Argument[this];ReturnValue;taint;manual"
			Set out = null;
			Uri in = (Uri)source();
			out = in.getQueryParameterNames();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getQueryParameters;;;Argument[this];ReturnValue;taint;manual"
			List out = null;
			Uri in = (Uri)source();
			out = in.getQueryParameters(null);
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getScheme;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getScheme();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getSchemeSpecificPart;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getSchemeSpecificPart();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;getUserInfo;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.getUserInfo();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;normalizeScheme;;;Argument[this];ReturnValue;taint;manual"
			Uri out = null;
			Uri in = (Uri)source();
			out = in.normalizeScheme();
			sink(out); // $ hasTaintFlow
		}
		{
			// "android.net;Uri;true;toString;;;Argument[this];ReturnValue;taint;manual"
			String out = null;
			Uri in = (Uri)source();
			out = in.toString();
			sink(out); // $ hasTaintFlow
		}

	}

}