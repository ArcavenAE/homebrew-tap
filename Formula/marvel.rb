class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260802.010356.299f493"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-010356-299f493/marvel-darwin-arm64"
    sha256 "4aa1236d975b32f896b83c762e30c45b57eb5fd70d96cae64e56afa78cee592c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-010356-299f493/marvel-darwin-amd64"
    sha256 "bc9cb37da760c59b8590c44b4472bee588c7c1360415a101ede435c0b5062202"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-010356-299f493/marvel-linux-arm64"
    sha256 "69b0b9ae391b9f57469f5d9baf2ec0a98f144da8164ca682af4d86bf73d76395"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-010356-299f493/marvel-linux-amd64"
    sha256 "89d9e3c78a1b325898c415dfa1d14111f98bbf7ea4a41f96173ef9f800a57ead"
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
