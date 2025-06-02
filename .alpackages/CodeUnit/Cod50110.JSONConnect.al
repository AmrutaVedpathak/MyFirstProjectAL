codeunit 50110 JSONConnect
{
    TableNo = "API Table";
    /*
        procedure JSONReadAndWrite(var APITable: Record "API Table")
        begin
            Client.Get('https://jsonplaceholder.typicode.com/users/' + Format(APITable.ID), Response);
            if Response.IsSuccessStatusCode then begin
                Content := Response.Content;
                Content.ReadAs(Result);

                Jsonobj.ReadFrom(Result);
                Jsonobj.Get('name', Jtoken);
                APITable.Name := Jtoken.AsValue().AsText();

                Jsonobj.Get('username', Jtoken);
                APITable."User Name" := Jtoken.AsValue().AsText();

                Jsonobj.Get('email', Jtoken);
                APITable.Email := Jtoken.AsValue().AsText();

                Jsonobj.Get('address', Jtoken);
                if Jtoken.IsObject then begin
                    Jtoken.WriteTo(Output);
                    NwJsonObj.ReadFrom(Output);
                    NwJsonObj.Get('street', NwJtoken);
                    APITable.Street := NwJtoken.AsValue().AsText();
                    NwJsonObj.Get('suite', NwJtoken);
                    APITable.Suit := NwJtoken.AsValue().AsText();
                end;
            end;

        end;
    */
    procedure JSONReadAndWrite(var APITable: Record "API Table")
    begin

        Client.Get('https://jsonplaceholder.typicode.com/users', Response);
        if Response.IsSuccessStatusCode then begin

            Content := Response.Content;
            Content.ReadAs(Result);

            Jtoken.ReadFrom(Result);

            IF APITable.FindLast() then begin
                UseId := APITable.ID;
            end;

            if Jtoken.IsArray then begin
                Jarray := Jtoken.AsArray();
                for i := 0 to Jarray.Count - 1 do begin
                    UseId += 1;
                    Jarray.Get(i, Jtoken);
                    if Jtoken.IsObject then begin
                        Jtoken.WriteTo(Output);
                        JsonObj.ReadFrom(Output);
                        APITable.ID := UseId;
                        Jsonobj.Get('name', Jtoken);
                        APITable.Name := Jtoken.AsValue().AsText();

                        Jsonobj.Get('username', Jtoken);
                        APITable."User Name" := Jtoken.AsValue().AsText();

                        Jsonobj.Get('email', Jtoken);
                        APITable.Email := Jtoken.AsValue().AsText();

                        Jsonobj.Get('address', Jtoken);
                        if Jtoken.IsObject then begin
                            Jtoken.WriteTo(Output1);
                            NwJsonObj.ReadFrom(Output1);
                            NwJsonObj.Get('street', NwJtoken);
                            APITable.Street := NwJtoken.AsValue().AsText();
                            NwJsonObj.Get('suite', NwJtoken);
                            APITable.Suit := NwJtoken.AsValue().AsText();
                        end;
                        APITable.Insert();
                    end;
                end;
            end;
        end;

    end;

    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        Result: Text;
        Output: Text;
        Content: HttpContent;
        Jsonobj: JsonObject;
        NwJsonObj: JsonObject;
        Jtoken: JsonToken;
        NwJtoken: JsonToken;
        Jarray: JsonArray;
        i: Integer;
        Output1: text;
        UseId: Integer;

}
