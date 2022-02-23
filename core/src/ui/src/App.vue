<template>
  <div>
    <div v-if="show" class="main">
      <div class="loaded" v-if="lobbys.length !== 0">
        <div id="left">
          <div class="lobbys">
            <h2>Lobbys</h2>
            <div v-for="(v, k) in lobbys" class="lobby" :key="k">
              <div class="data">
                <p>Lobby: {{ k }}</p>
                <p>Areena: {{ v.area }}</p>
                <p>Pelaajia: {{ v.players.length }}/10</p>
              </div>
              <button
                @click="join_lobby(k)"
                v-bind:style="
                  v.players.length == 10
                    ? 'background-color: #ae2e2e;'
                    : 'background-color: #35b335;'
                "
              >
                {{ v.players.length == 10 ? "Täynnä" : "Liity" }}
              </button>
            </div>
          </div>
        </div>
        <div id="right">
          <div class="user_data">
            <h2>Data</h2>
            <div>
              <p>Tapot: 10</p>
              <p>Kuolemat: 10</p>
              <p>Viimeisin ped: a_f_m_bevhills_01</p>
            </div>
          </div>
          <div class="peds">
            <h2>Peds</h2>
            <div>
              <div
                v-bind:style="
                  selected_ped == k ? 'background-color: #35b335;' : ''
                "
                @click="select_ped(k)"
                v-for="(v, k) in peds"
                class="ped"
                :key="k"
              >
                {{ v.name }}
              </div>
            </div>
          </div>
        </div>
      </div>
      <div v-else>Loading data....</div>
    </div>

    <div v-if="map_vote.on" class="map_vote">
      <h2>Map vote</h2>

      <div class="maps">
        <div class="map" v-for="(map, i) in map_vote.maps" v-bind:key="i">
          <div v-bind:style="map.selected ? 'color: green;' : 'color: #fff;'">
            {{ i + 1 }}. {{ map.name }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "App",

  data() {
    return {
      show: false,
      lobbys: [],
      peds: [],
      selected_ped: 0,
      map_vote: {
        on: false,
        maps: [],
      },
    };
  },

  setup() {
    return {
      eventListeners: {
        message: null,
        mapVote: null,
      },
    };
  },

  mounted() {
    console.log(JSON.stringify(this.map_vote));
    this.eventListeners.message = window.addEventListener("message", (e) => {
      const { data } = e;

      switch (data.action) {
        case "map_vote": {
          this.map_vote.on = !this.map_vote.on;
          this.map_vote.maps = data.data.maps || [];

          this.eventListeners.mapVote = ({ key }) => {
            let keyN = parseInt(key);

            if (keyN && this.map_vote.maps.length >= keyN) {
              let selectedMap = this.map_vote.maps[keyN - 1];
              this.map_vote.maps[keyN - 1].selected = true;

              fetch(`https://core/vote_change_map`, {
                method: "POST",
                body: JSON.stringify({ map: selectedMap.name }),
              });

              window.removeEventListener(
                "keydown",
                this.eventListeners.mapVote
              );
            }
          };

          window.addEventListener("keydown", this.eventListeners.mapVote);
          break;
        }
        case "show_ui": {
          this.show = data.show;
          if (data.data.lobbys && data.data.peds) {
            this.lobbys = data.data.lobbys;
            this.peds = data.data.peds;
          }
          break;
        }
      }
    });
  },

  unmounted() {
    window.removeEventListener("message", this.eventListeners.message);
  },

  methods: {
    select_ped(key) {
      let ped = this.peds[key];
      this.selected_ped = key;
      fetch(`https://core/change_ped`, {
        method: "POST",
        body: JSON.stringify({ ped: ped.name }),
      });
    },
    join_lobby(key) {
      let lobby = this.lobbys[key];
      if (lobby.players.length !== 10) {
        fetch(`https://core/join_lobby`, {
          method: "POST",
          body: JSON.stringify({ lobby: key }),
        });
      }
    },
  },
};
</script>
