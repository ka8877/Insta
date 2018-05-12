/**
 * 
 */
function autoHypenPhone(str){
            str = str.replace(/[^0-9]/g, '');
            var tmp = '';
            if( str.length < 5){
                return str;
            }else if(str.length < 8){
                tmp += str.substr(0, 4);
                tmp += '-';
                tmp += str.substr(4,4);
                return tmp;
                
//            }else if(str.length < 11){
//                tmp += str.substr(0, 3);
//                tmp += '-';
//                tmp += str.substr(3, 3);
//                tmp += '-';
//                tmp += str.substr(6);
//                return tmp;
//            }else{              
//                tmp += str.substr(0, 3);
//                tmp += '-';
//                tmp += str.substr(3, 4);
//                tmp += '-';
//                tmp += str.substr(7);
//                return tmp;
//            }
            }else{
            	tmp += str.substr(0, 4);
            	tmp += '-';
            	tmp += str.substr(4, 4);
            	return tmp;
            }
            return str;
        }

var phoneNumber = document.getElementById('phoneNumber');
phoneNumber.onkeyup = function(event){
        event = event || window.event;
        var _val = this.value.trim();
        this.value = autoHypenPhone(_val) ;
}