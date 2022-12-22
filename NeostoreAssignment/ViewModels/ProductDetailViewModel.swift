import Foundation

protocol HandleProdDetailsAPiProtocol : AnyObject
{
    func handleAPi()
    func handleError(_ msg : String)
}

class ProductDetailViewModel{
    
    var delegate : HandleProdDetailsAPiProtocol?
    var responceData : ProductDetailModel?
    
    func returnData(_ param : [String : Any] ){
        let url = "http://staging.php-dev.in:8844/trainingapp/api/products/getDetail?\(Array(param.keys)[0])=\(Array(param.values)[0])"
        HandleAPi.CallAPiwith(url: url, parameter: [:], method: .get, model: ProductDetailModel.self, header : [:] ) { [self] resp, err in
            print("product List",resp)
            if let status = resp.status{
                if status == 200{
                    print("got it ")
                    responceData = resp
                    delegate?.handleAPi()
                }
                else{
                    delegate?.handleError(resp.message ?? "No msg")
                    print("ERRor is ",resp.message!)
                }
            }
        }
    }
}
