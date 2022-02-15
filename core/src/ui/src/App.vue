<template>
<div v-if="map_vote.on" class="map_vote">
    <h2>Map vote</h2>

    <div class="maps">
        <div class="map" v-for="(map,i) in map_vote.maps" v-bind:key="i">
            <div v-bind:style="map.selected ? 'color: green;' : 'color: #fff;'">
                {{ i + 1 }}. {{ map.name }}
            </div>
        </div>
    </div>
</div>
</template>

<script>

export default {
  name: 'App',

  data() {
    return {
        map_vote: {
            on: false,
            maps: [],
        }
    }
  },

  setup() {
    return {
        eventListeners: {
            message: null,
            mapVote: null
        }
    }
  },

  mounted() {
  console.log(JSON.stringify(this.map_vote))
    this.eventListeners.message = window.addEventListener("message", (e) => {
        const { data } = e;

        switch (data.action) {
            case "map_vote": {
                this.map_vote.on = !this.map_vote.on;
                this.map_vote.maps = data.data.maps || [];

                this.eventListeners.mapVote = ({ key }) => {
                    let keyN = parseInt(key);

                    if(keyN && this.map_vote.maps.length >= keyN) {
                        let selectedMap = this.map_vote.maps[keyN - 1];
                        this.map_vote.maps[keyN - 1].selected = true;
                        
                        fetch(`https://core/vote_change_map`, {
                            method: "POST",
                            body: JSON.stringify({ map: selectedMap.name })
                        })
                        
                        window.removeEventListener("keydown", this.eventListeners.mapVote)
                    }
                };
                
                window.addEventListener("keydown", this.eventListeners.mapVote)
                break;
            }
        }

    });
  },

  unmounted() {
    window.removeEventListener("message", this.eventListeners.message);
  }
}
</script>
