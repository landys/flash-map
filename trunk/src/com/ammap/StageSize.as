class com.ammap.StageSize
{
    var __obj, __funct, __interval;
    function StageSize(obj, funct)
    {
        __obj = obj;
        __funct = funct;
        __interval = setInterval(__getSize, 10, [this]);
    } // End of the function
    function __getSize(params)
    {
        if (Stage.width != undefined && Stage.height != undefined && Stage.width != 0 && Stage.height != 0)
        {
            clearInterval(params[0].__interval);
            params[0].__obj[params[0].__funct](Stage.width, Stage.height);
        } // end if
    } // End of the function
} // End of Class
