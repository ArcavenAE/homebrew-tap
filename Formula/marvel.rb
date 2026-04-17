class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.003128.3e2f4f5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-003128-3e2f4f5/marvel-darwin-arm64"
    sha256 "a73d9402f320a0ddb38394e91c4eb7f5b18479553c8f2ca8737147b1e4eb24f6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-003128-3e2f4f5/marvel-darwin-amd64"
    sha256 "71ed968037bec2127cd6e590e82314209cf8a67b31feb7210324523bb4019119"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-003128-3e2f4f5/marvel-linux-amd64"
    sha256 "fc06becfb0c0774c17bb13179b8144d5451b12bbaac348385322a4e31f7bc432"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
