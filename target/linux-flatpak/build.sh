#!/usr/bin/env bash

set -euo pipefail

readonly APP="com.github.MihailK.OpenRecipeBookWeb"
readonly MANIFEST="${APP}.yml"
readonly REPO="orb"
readonly BUNDLE="${APP}.flatpak"

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak-builder --force-clean \
		--ccache \
		--install-deps-from=flathub \
                --repo="${REPO}" \
                build-dir \
                "${MANIFEST}"

flatpak build-bundle \
        --arch=x86_64 \
        "${REPO}" \
        "${BUNDLE}" \
        "${APP}" 
