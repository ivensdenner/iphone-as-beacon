# iPhone as Beacon

This project is a result of an exercise proposed at BEPiD, IFCE-Fortaleza.

The idea is to create an app where the iPhone act as a beacon while the app is running. Because of the iBeacon API characteristics, it just works in foreground.

The proximityUUID used in the project is `489FC4C2-F996-4CB3-A252-ECD29B39DC61`. You can change it at [AdvertiserViewController, line 25](https://github.com/ivensdenner/iphone-as-beacon/blob/70d7b7684cfed77be9365ba3e540f4459cf69ca5/iPhone%20as%20Beacon/iPhone%20as%20Beacon/AdvertiserViewController.swift#L25). While running the app, you can choose the `major` and `minor` values you want to advertise.

For more information about iBeacon e Region Monitoring, visit http://apple.co/1GXnt7Z and http://apple.co/1cVxPbH.