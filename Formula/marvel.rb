class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.204427.0910d28"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-204427-0910d28/marvel-darwin-arm64"
    sha256 "00db1e71d315dbd8bf8007c2e17a72b1f24d98871111bc664b701521fb4e9e91"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-204427-0910d28/marvel-darwin-amd64"
    sha256 "dacedd0ac20e20d32f00339a9f2146eafb31e96cca99ded4ff3833b6683c21dd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-204427-0910d28/marvel-linux-arm64"
    sha256 "d0c89b9e7dd7bc9e9726158e374576724b2db6271cd653ee4846ad258b345174"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-204427-0910d28/marvel-linux-amd64"
    sha256 "a233cd5d760409d1cf5b9f4c865de22de0df16b74dd1394599d5eff5413571bf"
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
