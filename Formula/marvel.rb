class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.083435.8ee29a2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-083435-8ee29a2/marvel-darwin-arm64"
    sha256 "9dddeee9b515f0554af2f41ed834d0db289e5f9d618201a0ce85a016fc457b99"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-083435-8ee29a2/marvel-darwin-amd64"
    sha256 "daf4e4e2bff668e08bccd476908d86c4fc1499b8c496e9ff32f708485399d276"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-083435-8ee29a2/marvel-linux-arm64"
    sha256 "1d23a0e699e9e91e9b7c0b312d2541566dbe10e31f33b9be47bc8e7e75591cf9"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-083435-8ee29a2/marvel-linux-amd64"
    sha256 "a2356ad2e9c3479168f15fd2740673330f586ca3e20716514f4ae7e323f6a308"
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
