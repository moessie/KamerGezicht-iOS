//
//  ViewController.swift
//  KamerGezicht
//
//  Created by Mustafa Aleshekir on 23-02-17.
//  Copyright © 2017 S&G. All rights reserved.
//

import UIKit
import WebKit
import AVFoundation
import GoogleMobileAds
import AudioToolbox

class ViewController: UIViewController , WKNavigationDelegate,GADBannerViewDelegate
{
    var webView:WKWebView!
    var button:UISwitch!
    public var addressField:UITextView!
    
    // Ad banner and interstitial views
    var adMobBannerView = GADBannerView()
    // IMPORTANT: REPLACE THE RED STRING BELOW WITH THE AD UNIT ID YOU'VE GOT BY REGISTERING YOUR APP IN http://apps.admob.com
    let ADMOB_BANNER_UNIT_ID = "ca-app-pub-8361854108971496/3892866960"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        button = UISwitch()
        button.frame = (frame: CGRect(x: self.view.frame.size.width - 70, y: 130, width: 50, height: 50))
        UserDefaults.standard.register(defaults: ["onmusic" : true])
        button.isOn = UserDefaults.standard.bool(forKey: "onmusic");
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.isHidden = true
        
        self.webView = WKWebView()
        self.webView.navigationDelegate = self
        
        view.addSubview(webView)
        let url:URL = Bundle.main.url(forResource: "index", withExtension: "html")!
        let req:URLRequest = URLRequest(url
            : url)
        webView.load(req)
        webView.translatesAutoresizingMaskIntoConstraints = false
        let width = NSLayoutConstraint(item: webView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: webView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: -20)
        let top = NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 20)
        view.addConstraints([width,height,top])
        // Init AdMob banner
//        initAdMobBanner()
        self.view.addSubview(button)
 
        
    }
    func buttonAction(sender: UISwitch!) {
        if sender.isOn{
        UserDefaults.standard.set(true, forKey: "onmusic")
            player?.play()
        }else{
            UserDefaults.standard.set(false, forKey: "onmusic")
            player?.stop()
        }
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        if (!(webView.url!.absoluteString == "")){
            let text: String = self.webView.url!.absoluteString
            //NSLog("my log %@", text)
            button.isHidden = true
            if text.range(of:"/pvv/") != nil{
                NSLog("pvv loaded")
                //muziek pvv laden
                self.playSound(which: "bensound-epic")
            }else if text.range(of:"/vvd/") != nil{
                NSLog("vvd loaded")
                self.playSound(which: "mark")
                //muziek vvd laden
            }else if text.range(of:"/denk/") != nil{
                NSLog("denk loaded")
                self.playSound(which: "denk")
                //muziek vvd laden
            }else if text.range(of:"/cda/") != nil{
                NSLog("cda loaded")
                self.playSound(which: "buma")
                //muziek vvd laden
            }else if text.range(of:"/d66/") != nil{
                NSLog("d66 loaded")
                self.playSound(which: "d66")
                //muziek d66 laden
            }else if text.range(of:"/christenunie/") != nil{
                NSLog("christenunie loaded")
                self.playSound(which: "christen")
                //muziek christenunie laden
            }else if text.range(of:"/groenlinks/") != nil{
                NSLog("groenlinks loaded")
                self.playSound(which: "groenlinks")
                //muziek groenlinks laden
            }else if text.range(of:"/50plus/") != nil{
                NSLog("50plus loaded")
                self.playSound(which: "50plus")
                //muziek 50plus laden
            }else if text.range(of:"/forumvoordemocratie/") != nil{
                NSLog("forumvoordemocratie loaded")
                self.playSound(which: "forum")
                //muziek forumvoordemocratie laden
            }else if text.range(of:"/deburgerbeweging/") != nil{
                NSLog("deburgerbeweging loaded")
                self.playSound(which: "burger")
                //muziek deburgerbeweging laden
            }else if text.range(of:"/geenpijl/") != nil{
                NSLog("geenpijl loaded")
                self.playSound(which: "geenpijl")
                //muziek geenpijl laden
            }else if text.range(of:"/artikel1/") != nil{
                NSLog("artikel1 loaded")
                self.playSound(which: "artikel1")
                //muziek artikel1 laden
            }else if text.range(of:"/liberatischepartij/") != nil{
                NSLog("liberatischepartij loaded")
                self.playSound(which: "liber")
                //muziek liberatischepartij laden
            }else if text.range(of:"/lokaalindekamer/") != nil{
                NSLog("lokaalindekamer loaded")
                self.playSound(which: "lokaal")
                //muziek lokaalindekamer laden
            }else if text.range(of:"/jezusleeft/") != nil{
                NSLog("jezusleeft loaded")
                self.playSound(which: "jezus")
                //muziek jezusleeft laden
            }else if text.range(of:"/mensenspirit/") != nil{
                NSLog("mensenspirit loaded")
                self.playSound(which: "spirit")
                //muziek mensenspirit laden
            }else if text.range(of:"/vrijedemocratischepartij/") != nil{
                NSLog("vrijedemocratischepartij loaded")
                self.playSound(which: "vrije")
                //muziek vrijedemocratischepartij laden
            }else if text.range(of:"/stemnl/") != nil{
                NSLog("stemnl loaded")
                self.playSound(which: "stemnl")
                //muziek stemnl laden
            }else if text.range(of:"/nietstemmers/") != nil{
                NSLog("nietstemmers loaded")
                self.playSound(which: "niet")
                //muziek nietstemmers laden
            }else if text.range(of:"/piratenpartij/") != nil{
                NSLog("piratenpartij loaded")
                self.playSound(which: "piraat")
                //muziek piratenpartij laden
            }else if text.range(of:"/vrijzinnigepartij/") != nil{
                NSLog("vrijzinnigepartij loaded")
                self.playSound(which: "vrijepartij")
                //muziek vrijzinnigepartij laden
            }else if text.range(of:"/nieuwewegen/") != nil{
                NSLog("nieuwewegen loaded")
                self.playSound(which: "nieuwewegen")
                //muziek nieuwewegen laden
            }else if text.range(of:"/vnl/") != nil{
                NSLog("vnl loaded")
                self.playSound(which: "vnl")
                //muziek vnl laden
            }else if text.range(of:"/ondernemerspartij/") != nil{
                NSLog("ondernemerspartij loaded")
                self.playSound(which: "ondernemers")
                //muziek ondernemerspartij laden
            }else if text.range(of:"/sgp/") != nil{
                NSLog("sgp loaded")
                self.playSound(which: "sgp")
                //muziek sgp laden
            }else if text.range(of:"/pvda/") != nil{
                NSLog("pvda loaded")
                self.playSound(which: "pvda")
                //muziek pvda laden
            }else if text.range(of:"/sp/") != nil{
                NSLog("sp loaded")
                self.playSound(which: "sp")
                //muziek sp laden
            }else if text.range(of:"/partijvoordedieren/") != nil{
                NSLog("dieren loaded")
                self.playSound(which: "sp")
                //muziek sp laden
            }else if text.range(of:"/credits/") != nil{
                button.isHidden = false
            }else{
                NSLog("music off")
                //muziek uit
                player?.stop()
            }
        }
    }
    
    var player: AVAudioPlayer?
    
    func playSound(which: String){
        
        let url = Bundle.main.url(forResource: which, withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            if UserDefaults.standard.bool(forKey: "onmusic"){
                player.prepareToPlay()
                player.play()
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    // MARK: -  ADMOB BANNER
    func initAdMobBanner() {
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            // iPhone
            adMobBannerView.adSize =  GADAdSizeFromCGSize(CGSize(width: 320, height: 50))
            adMobBannerView.frame = CGRect(x: 0, y: view.frame.size.height, width: 320, height: 50)
        } else  {
            // iPad
            adMobBannerView.adSize =  GADAdSizeFromCGSize(CGSize(width: 468, height: 60))
            adMobBannerView.frame = CGRect(x: 0, y: view.frame.size.height, width: 468, height: 60)
        }
        
        adMobBannerView.adUnitID = ADMOB_BANNER_UNIT_ID
        adMobBannerView.rootViewController = self
        adMobBannerView.delegate = self
        view.addSubview(adMobBannerView)
        
        let request = GADRequest()
        request.testDevices = ["e1f9817c768a888ef6650d9d78e4e234"]
        adMobBannerView.load(request)
    }
    
    
    // Hide the banner
    func hideBanner(_ banner: UIView) {
        UIView.beginAnimations("hideBanner", context: nil)
        banner.frame = CGRect(x: view.frame.size.width/2 - banner.frame.size.width/2, y: view.frame.size.height - banner.frame.size.height, width: banner.frame.size.width, height: banner.frame.size.height)
        UIView.commitAnimations()
        banner.isHidden = true
    }
    
    // Show the banner
    func showBanner(_ banner: UIView) {
        UIView.beginAnimations("showBanner", context: nil)
        banner.frame = CGRect(x: view.frame.size.width/2 - banner.frame.size.width/2, y: view.frame.size.height - banner.frame.size.height, width: banner.frame.size.width, height: banner.frame.size.height)
        UIView.commitAnimations()
        banner.isHidden = false
    }
    
    // AdMob banner available
    func adViewDidReceiveAd(_ view: GADBannerView) {
        showBanner(adMobBannerView)
    }
    
    // NO AdMob banner available
    func adView(_ view: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        hideBanner(adMobBannerView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

