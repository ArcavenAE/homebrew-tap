class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260914.200117.981023e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-200117-981023e/marvel-darwin-arm64"
    sha256 "cbc1d535ba42a0816715b7124e40ca71e89b9d91d9fd49cf8ca7ac697b0d4e15"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-200117-981023e/marvel-darwin-amd64"
    sha256 "36293b449b690d1b37c51eb8446f7d832e21f9adc1a0cb135def2ace8d9006c3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-200117-981023e/marvel-linux-arm64"
    sha256 "001e1f926ceec2919ccb8cadcb2abd5ae3adc6db5a7a9b3057e1ae5c57f17261"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-200117-981023e/marvel-linux-amd64"
    sha256 "8cc8dea5fdfb4aa93fc5513ed75aa6d41b3d98a2e3efe68c8204b0fa1cf4062c"
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
