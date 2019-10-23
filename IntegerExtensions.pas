﻿namespace iOSApp.Core;

uses
  Foundation, RemObjects.Elements.RTL;

type

  IntegerExtensions = public extension class(Integer)
  public
    method AsMonthDay:String;
    begin
      case self of
        1,21,31:
        exit NSString.stringWithFormat('%dst', self);
        2,22:
        exit NSString.stringWithFormat('%dnd', self);
        3,23:
        exit NSString.stringWithFormat('%drd', self);
        else
          exit NSString.stringWithFormat('%dth', self);
      end;

    end;

    method ForDisplay: String;
    begin
      exit self.FormatIntegerForDisplay;
    end;

    method AsDuration: String;
    begin
      var someValue := self;
      exit someValue.FormatAsDuration;
    end;

    method FormatIntegerForDisplay:NSString;
    begin
      exit NSString.stringWithFormat('%d', self);
    end;

    method FormatAsDuration:String;
    begin
      var span := new TimeSpan(0,self,0);
      var value := '';

      if(span.Days > 0)then
      begin
        value := $'{span.Days} Days {span.Hours} Hours {span.Minutes} minutes';
      end
      else
      begin
        value := $'{span.Hours} Hours {span.Minutes} minutes';
      end;
      exit value;
    end;

  end;

end.