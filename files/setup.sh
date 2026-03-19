#!/bin/bash
# =====================================================
# matt.git を academicpages テンプレートで
# GitHub Pages にデプロイするセットアップスクリプト
# =====================================================
# 実行前に: git config --global user.email と user.name を設定してください

set -e

REPO_URL="https://github.com/tetra4rnav/matt.git"
TEMPLATE_URL="https://github.com/academicpages/academicpages.github.io.git"
WORK_DIR="$HOME/matt-setup"

echo ">>> 作業ディレクトリを作成..."
mkdir -p "$WORK_DIR" && cd "$WORK_DIR"

echo ">>> academicpages テンプレートをクローン..."
git clone "$TEMPLATE_URL" site
cd site

echo ">>> origin を matt.git に変更..."
git remote remove origin
git remote add origin "$REPO_URL"

echo ">>> _pages/career-framework.md をコピー..."
# このスクリプトと同じディレクトリにあるファイルをコピー
cp "$(dirname "$0")/career-framework.md" _pages/career-framework.md

echo ">>> _config.yml の基本設定を更新..."
# タイトルや名前を sed で置換
sed -i 's/title: .*/title: "Matt Sakamaki, MD, MPH"/' _config.yml
sed -i 's/name: .*/name: "Matt Sakamaki"/' _config.yml
sed -i 's/description: .*/description: "MD, MPH Candidate | Social Epidemiology | Health Policy"/' _config.yml

echo ""
echo "============================================"
echo "次のステップ（手動で行う）:"
echo "============================================"
echo ""
echo "1. _config.yml を開いて以下を編集:"
echo "   - url: \"https://tetra4rnav.github.io\""
echo "   - baseurl: \"/matt\""
echo "   - repository: \"tetra4rnav/matt\""
echo "   - github_username: tetra4rnav"
echo "   - name/email/bio/location を記入"
echo ""
echo "2. _data/navigation.yml にキャリアフレームワークを追加:"
echo "   - title: \"Career Framework\""
echo "     url: /career-framework/"
echo ""
echo "3. GitHub リポジトリ Settings > Pages > Source:"
echo "   Branch: main / root に設定"
echo ""
echo "4. 以下のコマンドで push:"
echo "   cd $WORK_DIR/site"
echo "   git add ."
echo "   git commit -m 'Initial setup with career framework page'"
echo "   git push -u origin main"
echo ""
echo "5. デプロイ確認:"
echo "   https://tetra4rnav.github.io/matt/career-framework/"
echo ""
echo ">>> 完了。上記の手順を実行してください。"
