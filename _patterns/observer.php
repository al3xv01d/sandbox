<?php

interface SubjectInterface
{
    public function attachObserver(ObserverInterface $observer);
    public function detachObserver(ObserverInterface $observer);
    public function notify(EventInterface $event);
}
////////////////////////////////////////////////////////
interface ObserverInterface
{
    //public function update(SubjectInterface $subject);
    public function update(EventInterface $event);
}

//////////////////////////////////////////

interface EventInterface
{
    public function getName();
    public function getSender();
}
///////////////////////////////////////////////////
class FootballTeam implements SubjectInterface
{
    private $name;
    private $observers = [];

    public function __construct($name)
    {
        $this->name = $name;
    }

    public function attachObserver(ObserverInterface $observer) {
        $this->observers[] = $observer;
    }

    public function getName()
    {
        return $this->name;
    }

    public function detachObserver(ObserverInterface $observer) {
        foreach ($this->observers as $key => $obs) { // in foreach is copy of array
            if($obs === $observer ) {
                unset($this->observers[$key]);
                return;
            }
        }
    }

    public function notify(EventInterface $event) {
        foreach ($this->observers as $observer) { // in foreach is copy of array
            $observer->update($event);
        }
    }

    public function goalAction() {
        $event = new FootballEvent(FootballEvent::GOAL, $this);
        $this->notify($event);
    }

    public function goalEnemy() {
        $event = new FootballEvent(FootballEvent::GOAL_ENEMY, $this);
        $this->notify($event);
    }

    public function redcardAction() {
        $event = new FootballEvent(FootballEvent::RED_CARD, $this);
        $this->notify($event);
    }
}


//////////////////////////////////

class FootballFan implements ObserverInterface
{
    private $name;

    /**
     * FootballFan constructor.
     * @param $name
     */
    public function __construct($name)
    {
        $this->name = $name;
    }

    public function getName()
    {
        return $this->name;
    }

    public function update(EventInterface $event)
    {
        switch ($event->getName()) {
            case FootballEvent::GOAL:
                printf("GOOAL!!! - %s Отреагировал на gol <br>", $this->getName() );
                break;
            case FootballEvent::GOAL_ENEMY:
                printf("Нам забили гол. фанат - %s <br>", $this->getName() );
                break;
            case FootballEvent::RED_CARD:
                printf("Red Card. фанат - %s <br>", $this->getName() );
                break;
            default:
                printf("%s -- нет события -- %s <br>", $this->getName(), $event->getSender() );

        }

       //printf("%s Отреагировал на событие команды: %s <br>", $event->getName(), $event->getSender() );
       // echo 'Fan '.$this->getName().' react to event of team: '.$team->getName().' <br>';
    }
}


class FootballEvent implements EventInterface
{
    const GOAL = 'GOAL!!!!';
    const GOAL_ENEMY = 'ENEMY GOAL(';
    const RED_CARD = 'RED CARD';

    private $name;
    private $sender;

    public function __construct($name, FootballTeam $sender)
    {
        $this->name = $name;
        $this->sender = $sender;
    }



    public function getName()
    {
        return $this->name;
    }

    public function getSender()
    {
        return $this->sender;
    }

}



$team = new FootballTeam('Zenit');

$fan1 = new FootballFan('Ivan');
$fan2 = new FootballFan('Petr');

$team->attachObserver($fan1);
$team->attachObserver($fan2);

$team->goalAction();
$team->goalEnemy();
$team->redcardAction();

$team->detachObserver($fan2);



