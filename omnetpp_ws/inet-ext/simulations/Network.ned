package inet_ext.simulations;

import inet_ext.CanHost;
import inet_ext.physicallayer.CanBus;
import inet_ext.ros.RosInterface;
import ned.DatarateChannel;

network CanNet
{
    types:
        channel C extends DatarateChannel
        {
            delay = 0s;
            datarate = 10Mbps;
        }
    submodules:
        ros: RosInterface {
            parameters:
                @display("p=50,50;i=misc/cloud");
        }
        hostA: CanHost {
            parameters:
                @display("p=100,200");
        }
        sensor: CanHost {
            parameters:
                @display("p=250,200");
        }
        motor: CanHost {
            parameters:
                @display("p=400,200");
        }
        bus: CanBus {
            parameters:
                @display("p=325,100;b=500,6;o=#408060");
        }
    connections:
        bus.cang++ <--> C <--> hostA.cang;
        bus.cang++ <--> C <--> sensor.cang;
        bus.cang++ <--> C <--> motor.cang;
}
