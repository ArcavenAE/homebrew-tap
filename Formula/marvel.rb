class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.035042.570be47"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-035042-570be47/marvel-darwin-arm64"
    sha256 "29c8478ebc12671276537b5c9eaa9092df117395056521e9509244dc19d9cf8e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-035042-570be47/marvel-darwin-amd64"
    sha256 "61d42b703579460425f67fbdf71fa0cc885229efc5dd7b8567e58db2698dd722"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-035042-570be47/marvel-linux-arm64"
    sha256 "f107593562535488a6a8e791d76615a43d785899418173183fb734440d7a5fef"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-035042-570be47/marvel-linux-amd64"
    sha256 "beecc719add0cf2781e525c4f338fd112f401a291a698dd76885acff38bfc318"
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
