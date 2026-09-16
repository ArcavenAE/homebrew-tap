class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260916.163726.a397b45"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-163726-a397b45/marvel-darwin-arm64"
    sha256 "cea1bfe3d9c024f32c5c71160b22dba95cc29d10685c69036b48a9d0267db571"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-163726-a397b45/marvel-darwin-amd64"
    sha256 "dbc6f59a7e707e33a14ff940e7a6621e6b2fa26f5b5d1dc98084647d5bee59fd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-163726-a397b45/marvel-linux-arm64"
    sha256 "bbb5b183051a6774c2963f61344e03bffb1afb15f77c3af11a4e5110bd3bbf80"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-163726-a397b45/marvel-linux-amd64"
    sha256 "1aafcf6b87db83eeacff21d4493cb8fb7ea60b83bf2f928cecf9a89ad9eeb3d5"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
