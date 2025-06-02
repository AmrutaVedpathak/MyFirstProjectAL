page 50117 "What is my Ip Address"
{
    Caption = 'What is my Ip Address';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Editable = False;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(IP; GetIP())
                {
                    Caption = 'This is my Current IP Address';
                    ApplicationArea = All;

                }


            }
        }
    }
    procedure GetIP(): Text
    var

        Client: HttpClient;
        Response: HttpResponseMessage;
        ResponseTxt: Text;
        J: JsonObject;
        JT: JsonToken;
    begin
        If Client.Get('https://api.ipify.org?format=json', Response) then begin
            if Response.IsSuccessStatusCode then begin
                Response.Content.ReadAs(ResponseTxt);
                j.ReadFrom(ResponseTxt);
                if j.Get('ip', JT) then
                    exit(JT.AsValue().AsText());

            end;

        end;
    end;
}
