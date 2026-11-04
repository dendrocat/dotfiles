pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property MaterialYouPallete pallete: MaterialYouPallete {}

    function lerpSmoothed(c1, c2, t) {
        let smooth = t < 0.5 ? 2 * t * t : 1 - Math.pow(-2 * t + 2, 2) / 2;
        return lerp(c1, c2, smooth);
    }
    function lerp(c1, c2, t) {
		return Qt.rgba(
			c1.r + (c2.r - c1.r) * t,
			c1.g + (c2.g - c1.g) * t,
			c1.b + (c2.b - c1.b) * t,
			c1.a + (c2.a - c1.a) * t);
    }

    function load(data): void {
        var json = JSON.parse(data);
        for (const [key, value] of Object.entries(json)) {
			if (!pallete.hasOwnProperty(key)) continue;
            pallete[key] = value;
        }
    }

    FileView {
        id: fileView
        path: Qt.resolvedUrl("colors.json")

        watchChanges: true
        onFileChanged: reload()
        onLoaded: root.load(text())
    }

    component MaterialYouPallete: QtObject {

        property color background: "#121318"

        property color error: "#ffb4ab"

        property color error_container: "#93000a"

        property color inverse_on_surface: "#2f3036"

        property color inverse_primary: "#485d92"

        property color inverse_surface: "#e2e2e9"

        property color on_background: "#e2e2e9"

        property color on_error: "#690005"

        property color on_error_container: "#ffdad6"

        property color on_primary: "#172e60"

        property color on_primary_container: "#dae2ff"

        property color on_primary_fixed: "#001847"

        property color on_primary_fixed_variant: "#304578"

        property color on_secondary: "#2a3042"

        property color on_secondary_container: "#dce2f9"

        property color on_secondary_fixed: "#151b2c"

        property color on_secondary_fixed_variant: "#404659"

        property color on_surface: "#e2e2e9"

        property color on_surface_variant: "#c5c6d0"

        property color on_tertiary: "#412742"

        property color on_tertiary_container: "#fed7f9"

        property color on_tertiary_fixed: "#2b122c"

        property color on_tertiary_fixed_variant: "#5a3d59"

        property color outline: "#8f9099"

        property color outline_variant: "#45464f"

        property color primary: "#b2c5ff"

        property color primary_container: "#304578"

        property color primary_fixed: "#dae2ff"

        property color primary_fixed_dim: "#b2c5ff"

        property color scrim: "#000000"

        property color secondary: "#c0c6dd"

        property color secondary_container: "#404659"

        property color secondary_fixed: "#dce2f9"

        property color secondary_fixed_dim: "#c0c6dd"

        property color shadow: "#000000"

        property color source_color: "#2952a9"

        property color surface: "#121318"

        property color surface_bright: "#38393f"

        property color surface_container: "#1e1f25"

        property color surface_container_high: "#282a2f"

        property color surface_container_highest: "#33343a"

        property color surface_container_low: "#1a1b21"

        property color surface_container_lowest: "#0d0e13"

        property color surface_dim: "#121318"

        property color surface_tint: "#b2c5ff"

        property color surface_variant: "#45464f"

        property color tertiary: "#e1bbdd"

        property color tertiary_container: "#5a3d59"

        property color tertiary_fixed: "#fed7f9"

        property color tertiary_fixed_dim: "#e1bbdd"
    }
}
