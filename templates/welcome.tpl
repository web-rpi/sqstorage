{include file="head.tpl" title="{t}Welcome!{/t}"}
{include file="nav.tpl" target="welcome.php" request=$REQUEST}
<style type="text/css">
    .introShortcuts {
        list-style: decimal;
        line-height: 1.7em;
    }

    a.headLink {
        font-weight: bold;
        font-size: 1.5em;
    }

    .content {
        margin: 3em 8em;
    }

    .content>article {
        margin-top: 4em;
        margin-bottom: 0px;
        max-width: 100ch;
    }

    .content>article p {
        line-height: 1.4;
        font-size: 1.2em;
    }

    .content>article>p>a {
        text-decoration: underline;
        font-weight: bold;
    }

    .content>hr {
        margin: 0em;
        margin-bottom: 3em;
    }

    .credits {
        list-style: none;
        line-height: 2em;
        padding: 0px;
    }

    .credits {
        font-size: 1em;
        margin-bottom: 5em;
        text-align: left;
    }

    .credits .name {
        font-weight: bold;
        margin-right: 1ch;
    }

    .credits a {
        font-style: italic;
    }
</style>

<div class="content">
    <h1>Welcome to sqStorage!</h1>
    <h5>The quick and easy inventory and storage area manager</h5>
    <ul class="introShortcuts">
        <li>
            <a href="#welcome">Welcome</a>
        </li>
        <li>
            <a href="#basics">Basic introduction</a>
        </li>
        <li>
            <a href="#feedback">Feedback</a>
        </li>
        <li>
            <a href="#forward">Going forward</a>
        </li>
        <li>
            <a href="#credits">Credits</a>
        </li>
    </ul>

    <hr>

    <article>
        <h6><a class="headLink" name="welcome">Welcome</a></h6>
        <p>To sqStorage or short <b>sqS</b>.</p>
        <p>If this is the first time you are seeing this page take a minute to read on. This is highly recommended as you will get a basic introduction and also further information how you can help make sqS even more awesome or simply adapt it to your needs.</p>
        <p>Or if you want to know about who are the people behind this project, find the credits below to see who shaped this project.</p>
    </article>
    <hr>
    <article>
        <h6><a class="headLink" name="basics">Basic introduction</a></h6>
        <p>This text &quot;Basic introduction&quot; is directed at first time users of sqS. In case you are new, there is some basic guide on what you can do.</p>

        <h6>Brief summary</h6>
        <p>In sqS you can easily create storages (areas, rooms, places, chests, cupboards, boxes...), inventories, collections of all kind. For example your movie/game/music/application collection or anything else you like to keep an eye on. <b>It is simple: You name it, sqStorage stores it!</b></p>

        <h6>Basics</h6>
        <p>Going further, you can add items of any kind with basic informations like title/label, amount, comments, serial number, and article numbers as default/basic fields. And also you have the option to make use of item categories and subcategories to further narrow down items.</p>
        <p>To add storages, create a item and input your desired storage name, the storage will then be created and the item will be stored in this storage. If you add another item, you can reselect the storage or create another storage.</p>

        <h6>Extendable and custom data fields</h6>
        <p>But sqS is not limited to that information and can extended by yourself.</p>
        <p>sqS can be extended by your own desired informations, for example if you need &quot;Game keys&quot; or &quot;Serial numbers/keys&quot; you can simply add a custom datafield which stores this information for the category &quot;Games&quot; and also &quot;Applications&quot;. Or you need a buying price, you can add this as a custom field too. The best of it, you can assign for which type or category of items the custom data field refers too. So this information is not presented for categories of items, you do not want the data to be entered or displayed.</p>

        <h6>User system</h6>
        <p>In case you want to secure your sqS installation from other parties, you can do so by enabling a user system. You can add administrators, users and guests - each having there own permissions.</p>
        <p>Basically, administrators can do everything, like creating users. Users are allowed to add, create, delete, items and categories or custom fields. Guest only can view what is stored, they have no other rights what so ever.</p>

    </article>
    <hr>
    <article>
        <h6><a class="headLink" name="feedback">Feedback</a></h6>
        <p>Feedback is simply what drives this project! Really, it does matter.</p>
        <p>You do not need to be a programmer or software engineer or something like that to provide feedback. Everyone who is willing to spend 5 minutes of their time while reporting a problem in the software (bug), or by explaining a use case, or simply let everyone know that you use it succesfully - is more then welcome.</p>
        <p>You can add suggestions, recommendations and general feedback to <a href="mailto:jan@sqstorage.net?subject=sqStorage welcome feedback">Jan`s email</a> and he will gladly answer.</p>
        <p>But you can also report bugs or feature requests online at the projects Github site: <a href="https://github.com/jrie/sqstorage/issues" target="_blank">https://github.com/jrie/sqstorage/issues</a>.</p>
    </article>
    <hr>
    <article>
        <h6><a class="headLink" name="forward">Going forward</a></h6>
        <p>Since you read about the arcane mysteries of this software, you can go on and create your first item, in your first storage. in your first category. And a second and third item. You will quickly get the hang of it.</p>
        <p>And in case you are getting stuck, see &quot;Feedback&quot; and write a email or raise an issue/bug report if a needed feature is missing.</p>
        <p>The team behind sqStorage is happily helping you to get things done.</p>
    </article>
    <hr>
    <article>
        <h6><a class="headLink" name="credits">Credits</a></h6>
        <p>
            Following a list, in alphabetical order, of all the folks, helping and shaping sqStorage.<br>
            Without all of you the project would not be what it is right now!
        </p>
        <ul class="credits">
            <li>
                <p>
                    <span class="name">Aleksandra F.</span><a href="https://djomtka.com">djomtka.com</a><br>
                    Polish translation
                </p>
            </li>
            <li>
                <p>
                    <span class="name">Dexter H. C.</span><a href="https://ngb.to">ngb.to</a><br>
                    Design feedback and pentesting
                </p>
            </li>
            <li>
                <p>
                    <span class="name">Jan R.</span><a href="https://dwrox.net">dwrox.net</a><br>
                    Project owner, initial and ongoing coding
                </p>
            </li>
            <li>
                <p>
                    <span class="name">Jonathan L.</span><a href="https://www.twdmgmt.com/exilium/">twdmgmt.com/exilium</a><br>
                    French translation
                </p>
            </li>
            <li>
                <p>
                    <span class="name">Stephan L.</span><a href="https://lauermann-it.de">lauermann-it.de</a><br>
                    Testing and feedback
                </p>
            </li>
            <li>
                <p>
                    <span class="name">Volker B.</span><a href="https://schnoog.eu/">schnoog.eu</a><br>
                    Coding of API, user system, smarty templating, translation and much much more
                </p>
            </li>
        </ul>
    </article>
</div>

{include file="footer.tpl"}
{literal}
<script type="text/javascript">
</script>
{/literal}
{include file="bodyend.tpl"}