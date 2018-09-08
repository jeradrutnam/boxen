import ballerina/io;

documentation {
    Boxen object which provides capabilities to draw box around text.
}
public type Boxen object {

    private function repeating(string stringToRepeat, int repeatLength) returns (string) {
        int i = 0;
        string repeatedText = "";

        while (i < repeatLength) {
            repeatedText += stringToRepeat;
            i += 1;
        }

        return repeatedText;
    }

    private function filledArray(string repeatText, int repeatCount) returns (string[]) {
        int i = 0;
        string[] repeatArray;

        while (i < repeatCount) {
            repeatArray[i] = repeatText;
            i += 1;
        }

        return repeatArray;
    }

    private function concatStringArray(string[] a, string[] b) returns (string[]) {
        string[] concatinated;

        int count = (lengthof b);
        int i = 0;

        while (i < (lengthof b)) {
            concatinated[i] = b[i];
            i += 1;
        }

        i = 0;

        while (i < (lengthof a)) {
            concatinated[i + count] = a[i];
            i += 1;
        }
        
        return concatinated;
    }

    public function write(string text) returns string {
        string nl = "\n";
	    string pad = " ";
        string[] lines = text.split(nl);

        int padding = 2;

        map<int> paddingJson = {
			xtop: padding,
			xright: padding * 3,
			xbottom: padding,
			xleft: padding * 3
		};

        int textLength = text.length();

        if (paddingJson.xtop > 0) {
            lines = concatStringArray(filledArray("", paddingJson.xtop), lines);
        }

        if (paddingJson.xbottom > 0) {
            lines = concatStringArray(lines, filledArray("", paddingJson.xbottom));
        }

        int contentWidth = textLength + paddingJson.xleft + paddingJson.xright;

        string horizontal = repeating("─", contentWidth);
	    string top = "┌" + horizontal + "┐";
	    string bottom = "└" + horizontal + "┘";
        
	    string side = "│";
        string middle = "";

        foreach line in lines {
            match line {
                string lineString => {
                    string paddingLeft = repeating(pad, paddingJson.xleft);
		            string paddingRight = repeating(pad, contentWidth - line.length() - paddingJson.xright);

                    middle += side + paddingLeft + lineString + paddingRight + side + nl;
                }
            }
        }
    
        return top + nl + middle + bottom;
    }

};